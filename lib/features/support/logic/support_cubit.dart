import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sayer_app/features/support/logic/support_state.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/helpers/error_codes.dart';
import 'package:sayer_app/common/helpers/user_session.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportState.initial());

  final TextEditingController supportTextfield = TextEditingController();

  Future<void> _sendMessage(String collectionName, String formWhere) async {
    emit(SupportState.loading());

    if (userPhoneNumber.isEmpty) {
      emit(
        SupportState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(401))),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection(collectionName).add({
        'Msg': supportTextfield.text,
        'phoneNumber': userPhoneNumber,
        'timestamp': FieldValue.serverTimestamp(),
        'formWhere': formWhere,
        'UserName': '$userName $lastName',
      });

      emit(SupportState.successfulSend());
    } catch (e) {
      emit(
        SupportState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(501))),
      );
    }
  }

  void saveMessage() => _sendMessage('Custmer_serive', 'CustomerService');

  void suggestionCars(String formWhere) =>
      _sendMessage('SuggestionCars', formWhere);

  void suggestions() => _sendMessage('Suggestions', 'Suggestions');

  void questions() => _sendMessage('Questions', 'Questions');

  void requestAccountDeletion() async {
    emit(SupportState.loading());

    if (userPhoneNumber.isEmpty) {
      emit(
        SupportState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(401))),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('Delete_Account').add({
        'phoneNumber': userPhoneNumber,
        'timestamp': FieldValue.serverTimestamp(),
        'request_type': 'DeleteAccount',
      });

      emit(SupportState.successfulSend());
    } catch (e) {
      emit(
        SupportState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(502))),
      );
    }
  }
}

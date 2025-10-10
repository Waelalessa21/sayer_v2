import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/login/logic/login_state.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/features/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginState.initial());

  final GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  late String otpcode = '';
  late String phoneNumber = '';

  Future<void> generateOtpRequest() async {
    emit(LoginState.initial());
    emit(LoginState.loading());

    try {
      final response = await loginRepo.generateOtp(phoneNumber);

      response.when(
        success: (data) {
          emit(LoginState.phoneNumberSubmitted());
        },
        failure: (error) {
          _emitError(error.msg ?? "خطأ في إرسال الرمز");
        },
      );
    } catch (e) {
      _emitError("خطأ في الاتصال");
    }
  }

  Future<void> regenerateOtpRequest() async {
    emit(LoginState.initial());
    emit(LoginState.loading());
    try {
      final response = await loginRepo.generateOtp(phoneNumber);

      response.when(
        success: (data) {
          emit(LoginState.phoneOTPResend());
        },
        failure: (error) {
          _emitError(error.msg ?? "خطأ في إعادة إرسال الرمز");
        },
      );
    } catch (e) {
      _emitError("خطأ في الاتصال");
    }
  }

  void _emitError(String errorMessage) {
    emit(LoginState.error(ApiErrorModel(msg: errorMessage)));
  }
}

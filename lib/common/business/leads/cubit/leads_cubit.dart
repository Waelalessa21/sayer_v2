import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/helpers/error_codes.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_state.dart';
import 'package:sayer_app/common/data/leads/model/leades_model.dart';
import 'package:sayer_app/common/data/leads/service/leads_service.dart';
import 'package:sayer_app/common/networking/api_result.dart';

class LeadsCubit extends Cubit<LeadsState> {
  final LeadsService _leadsService;

  LeadsCubit(this._leadsService) : super(LeadsState.initial());

  Future<void> submitLead(int carOfferId) async {
    emit(LeadsState.loading());
    try {
      final lead = LeadesModelPOST(offer_id: carOfferId, user_id: userId);

      final response = await _leadsService.submitLead(lead);
      response.when(
        success: (_) {
          emit(LeadsState.successSent());
        },
        failure: (error) {
          _handleError(error);
        },
      );
    } catch (error) {
      _handleError(error);
    }
  }

  Future<LeadesModel> getLeadByPhoneNumber(String phone) async {
    emit(LeadsState.loading());
    try {
      final response = await _leadsService.getLeadByPhoneNumber(phone);

      return response.when(
        success: (lead) {
          emit(LeadsState.successFetch(lead.items));
          return lead;
        },
        failure: (error) {
          _handleError(error);
          return LeadesModel(items: []);
        },
      );
    } catch (error) {
      _handleError(error);
      return LeadesModel(items: []);
    }
  }

  Future<LeadesModel> getLeadByUserId(int userId) async {
    emit(LeadsState.loading());
    try {
      final response = await _leadsService.getLeadByUserId(userId);

      return response.when(
        success: (lead) {
          emit(LeadsState.successFetch(lead.items));
          return lead;
        },
        failure: (error) {
          _handleError(error);
          return LeadesModel(items: []);
        },
      );
    } catch (error) {
      _handleError(error);
      return LeadesModel(items: []);
    }
  }

  void _handleError(dynamic error) {
    if (error is ApiErrorModel) {
      if (error.msg == "Not authenticated") {
        emit(
          LeadsState.error(
            ApiErrorModel(msg: "أكمل تسجيل حسابك للمتابعة.", type: ""),
          ),
        );
      } else {
        emit(
          LeadsState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(101))),
        );
      }
    } else if (error is DioError) {
      if (error.response?.statusCode == 401 ||
          (error.response?.data is Map &&
              error.response?.data["detail"] == "Not authenticated")) {
        emit(
          LeadsState.error(ApiErrorModel(msg: "أكمل تسجيل حسابك للمتابعة.")),
        );
      } else if (error.response?.statusCode == 500) {
        emit(
          LeadsState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(500))),
        );
      } else {
        emit(
          LeadsState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(999))),
        );
      }
    } else {
      emit(
        LeadsState.error(ApiErrorModel(msg: ErrorCodes.getErrorMessage(999))),
      );
    }
  }
}

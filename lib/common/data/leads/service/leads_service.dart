import 'package:dio/dio.dart';
import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/common/data/leads/model/leades_model.dart';
import 'package:sayer_app/common/data/leads/repo/leads_repo.dart';

class LeadsService {
  final LeadRepo _leadsRepo;

  LeadsService(this._leadsRepo);

  Future<ApiResult<void>> submitLead(LeadesModelPOST lead) async {
    try {
      await _leadsRepo.submitLead(lead);
      return ApiResult.success(null);
    } catch (error) {
      if (error is DioError && error.response?.statusCode == 422) {
        final errorMessage =
            'يرجى التحقق من الحقول المدخلة والمحاولة مرة أخرى.';
        return ApiResult.failure(ApiErrorHandler.handle(errorMessage));
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LeadesModel>> getLeadByPhoneNumber(String phone) async {
    try {
      final response = await _leadsRepo.getLeadByPhoneNumber(phone);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LeadesModel>> getLeadByUserId(int userId) async {
    try {
      final response = await _leadsRepo.getLeadByUserId(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

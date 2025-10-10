import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/common/networking/dio_factory.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/features/otp/data/model/otp_model.dart';
import 'package:sayer_app/features/otp/data/service/otp_service.dart';

class OtpRepo {
  final OtpService _otpService;

  OtpRepo(this._otpService);

  Future<ApiResult<OtpResponseModel>> verifyOtp(
    String phone,
    String activeKey,
  ) async {
    try {
      final response = await _otpService.verifyOtp(
        OtpModel(phone: phone, activeKey: activeKey),
      );

      if (response.accessToken != null && response.accessToken!.isNotEmpty) {
        DioFactory.setTokenIntoHeaderAfterLogin(response.accessToken!);
        token = response.accessToken!;
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/login/data/model/login_model.dart';
import 'package:sayer_app/features/login/data/service/login_service.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<ApiResult<GenerateOtpResponseModel>> generateOtp(
    String phoneNumber,
  ) async {
    try {
      final loginModel = LoginModel(phone: phoneNumber);
      final response = await _loginService.generateOtp(loginModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

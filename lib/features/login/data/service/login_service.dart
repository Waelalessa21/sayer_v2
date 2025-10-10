import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/features/login/data/model/login_model.dart';
part 'login_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST(ApiConstants.genrateOtp)
  Future<GenerateOtpResponseModel> generateOtp(@Body() LoginModel loginRequest);
}

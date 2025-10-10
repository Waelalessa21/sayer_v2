import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/features/otp/data/model/otp_model.dart';

part 'otp_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OtpService {
  factory OtpService(Dio dio, {String baseUrl}) = _OtpService;

  @POST(ApiConstants.verifyOtp)
  Future<OtpResponseModel> verifyOtp(@Body() OtpModel otpModel);
}

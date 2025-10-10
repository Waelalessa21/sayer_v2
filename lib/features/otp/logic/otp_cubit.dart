import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/otp/logic/otp_state.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/features/otp/data/repo/otp_repo.dart';
import 'package:sayer_app/features/login/data/repo/login_repo.dart';
import 'package:sayer_app/common/helpers/shared_preference.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/networking/dio_factory.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo otpRepo;
  final LoginRepo loginRepo;

  OtpCubit(this.otpRepo, this.loginRepo) : super(OtpState.initial());

  late String otpcode = '';
  late String phoneNumber = '';

  Future<void> verifyOtpRequest() async {
    emit(OtpState.initial());
    emit(OtpState.loading());

    try {
      final response = await otpRepo.verifyOtp(phoneNumber, otpcode);

      response.when(
        success: (data) async {
          if (data.accessToken != null && data.accessToken!.isNotEmpty) {
            await SharedPrefHelper.setSecuredString("Token", data.accessToken!);
            await SharedPrefHelper.setSecuredString("PhoneToken", phoneNumber);

            token = data.accessToken!;
            userPhoneNumber = phoneNumber;
            isLoggedInUser = true;

            DioFactory.setTokenIntoHeaderAfterLogin(data.accessToken!);
          }
          emit(OtpState.otpVerified());
        },
        failure: (error) {
          _emitError(error.msg ?? "خطأ في التحقق من الرمز");
        },
      );
    } catch (e) {
      _emitError("خطأ في الاتصال");
    }
  }

  Future<void> regenerateOtpRequest() async {
    emit(OtpState.initial());
    emit(OtpState.loading());

    try {
      final response = await loginRepo.generateOtp(phoneNumber);

      response.when(
        success: (data) {
          emit(OtpState.otpResent());
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
    emit(OtpState.error(ApiErrorModel(msg: errorMessage)));
  }
}

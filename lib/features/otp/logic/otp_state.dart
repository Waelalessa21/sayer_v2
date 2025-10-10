import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = Loading;
  const factory OtpState.error(ApiErrorModel error) = Error;
  const factory OtpState.otpVerified() = OtpVerified;
  const factory OtpState.otpResent() = OtpResent;
}

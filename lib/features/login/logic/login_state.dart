import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.error(ApiErrorModel error) = Error;
  const factory LoginState.phoneNumberSubmitted() = PhoneNumberSubmitted;
  const factory LoginState.phoneOTPVerified() = PhoneOTPVerified;
  const factory LoginState.phoneOTPResend() = PhoneOTPResend;
}

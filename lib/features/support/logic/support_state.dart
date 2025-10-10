import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';

part 'support_state.freezed.dart';

@freezed
abstract class SupportState with _$SupportState {
  const factory SupportState.initial() = _Initial;
  const factory SupportState.loading() = Loading;
  const factory SupportState.error(ApiErrorModel message) = Error;
  const factory SupportState.successfulSend() = SuccessfulSend;
}

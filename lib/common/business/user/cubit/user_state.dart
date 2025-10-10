import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.successSended() = SuccessSended;
  const factory UserState.successFetch(String userName) = SuccessFetch;
  const factory UserState.successFetchId(int userId) = SuccessFetchId;
  const factory UserState.error(ApiErrorModel message) = Error;
  const factory UserState.updateUserSuccess(String userName) =
      UpdateUserSuccess;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/data/leads/model/leades_model.dart';

part 'leads_state.freezed.dart';

@freezed
class LeadsState with _$LeadsState {
  const factory LeadsState.initial() = _Initial;
  const factory LeadsState.loading() = Loading;
  const factory LeadsState.successSent() = SuccessSent;
  const factory LeadsState.successFetch(List<LeadesData>? lead) = SuccessFetch;
  const factory LeadsState.error(ApiErrorModel message) = Error;
}

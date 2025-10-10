import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/data/dealerships/model/dealerships_model.dart';

part 'dealership_state.freezed.dart';

@freezed
abstract class DealershipState with _$DealershipState {
  const factory DealershipState.initial() = _Initial;
  const factory DealershipState.dealershipLoading() = DealershipLoading;
  const factory DealershipState.dealershipSuccess(
    List<DealershipData?>? dealerships,
  ) = DealershipSuccess;
  const factory DealershipState.dealershipError(ApiErrorModel error) =
      DealershipError;
}

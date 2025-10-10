import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';

part 'brands_state.freezed.dart';

@freezed
class BrandsState with _$BrandsState {
  const factory BrandsState.initial() = _Initial;
  const factory BrandsState.loading() = Loading;
  const factory BrandsState.success(List<BrandData?>? brands) = Success;
  const factory BrandsState.error(ApiErrorModel error) = Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

part 'car_offers_state.freezed.dart';

@freezed
abstract class CarOffersState with _$CarOffersState {
  const factory CarOffersState.initial() = _Initial;
  const factory CarOffersState.carOffersLoading() = CarOffersLoading;
  const factory CarOffersState.carOffersSuccess(
    List<CarOfferData?>? carOffers,
  ) = CarOffersSuccess;
  const factory CarOffersState.carOffersError(ApiErrorModel error) =
      CarOffersError;
}

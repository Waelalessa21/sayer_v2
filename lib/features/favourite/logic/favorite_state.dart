import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayer_app/features/favourite/data/model/favorite_model.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.successSended() = SuccessSended;
  const factory FavoriteState.successFetch(FavoritesModel favoritesCarOffers) =
      SuccessFetch;
  const factory FavoriteState.successDelete() = SuccessDelete;
  const factory FavoriteState.error(ApiErrorModel message) = Error;
  const factory FavoriteState.successFound() = SuccessFound;
}

import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/favourite/data/model/favorite_model.dart';
import 'package:sayer_app/features/favourite/data/service/favorites_service.dart';
import 'package:sayer_app/features/favourite/logic/favorite_state.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesService _favortie;
  FavoriteCubit(this._favortie) : super(FavoriteState.initial());

  Future<bool> addFavorite(int user_id, int offer_id) async {
    emit(FavoriteState.loading());
    final favoriteCar = FavoriteModelPOST(user_id: user_id, offer_id: offer_id);
    final response = await _favortie.addFavorite(favoriteCar);
    response.when(
      success: (voidResponse) {
        emit(FavoriteState.successSended());
        return true;
      },
      failure: (error) {
        emit(FavoriteState.error(error));
        return false;
      },
    );
    return false;
  }

  Future<CarOfferData?>? getFavorites(
    int userId,
    int page,
    int pageSize,
  ) async {
    emit(FavoriteState.loading());
    final response = await _favortie.getFavorites(userId, page, pageSize);
    response.when(
      success: (favorites) {
        emit(FavoriteState.successFetch(favorites));
      },
      failure: (error) {
        emit(FavoriteState.error(error));
      },
    );
    return null;
  }

  Future<bool> deleteFavorite(int offerId) async {
    emit(FavoriteState.loading());
    final response = await _favortie.deleteFavorite(userId, offerId);
    response.when(
      success: (voidResponse) {
        emit(FavoriteState.successDelete());
        return true;
      },
      failure: (error) {
        emit(FavoriteState.error(error));
        return false;
      },
    );
    return false;
  }

  Future<bool> checkIfFavorite(int userId, int offerId) async {
    try {
      final response = await _favortie.getFavorites(userId, 1, 7);

      return response.when(
        success: (isFavorite) {
          bool isFound =
              isFavorite.items?.any(
                (element) => element.offerId?.id == offerId,
              ) ??
              false;
          return isFound;
        },
        failure: (error) {
          emit(FavoriteState.error(error));
          return false;
        },
      );
    } catch (e) {
      emit(FavoriteState.error(ApiErrorModel(msg: e.toString())));
      return false;
    }
  }
}

import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/favourite/data/model/favorite_model.dart';
import 'package:sayer_app/features/favourite/data/repo/favorite_repo.dart';

class FavoritesService {
  final FavoriteRepo _favoriteRepo;

  FavoritesService(this._favoriteRepo);

  Future<ApiResult<void>> addFavorite(FavoriteModelPOST favorite) async {
    try {
      await _favoriteRepo.addFavorite(favorite);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<FavoritesModel>> getFavorites(
    int userId,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _favoriteRepo.getFavorites(userId, page, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteFavorite(int userId, int offerId) async {
    try {
      await _favoriteRepo.deleteFavorite(userId, offerId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

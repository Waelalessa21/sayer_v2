import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/features/favourite/data/model/favorite_model.dart';

part 'favorite_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FavoriteRepo {
  factory FavoriteRepo(Dio dio, {String baseUrl}) = _FavoriteRepo;

  @POST("/car_favorites")
  Future<void> addFavorite(@Body() FavoriteModelPOST favorite);

  @GET("/car_favorites")
  Future<FavoritesModel> getFavorites(
    @Query("user_id") int userId,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @DELETE("/car_favorites")
  Future<void> deleteFavorite(
    @Query("user_id") int userId,
    @Query("offer_id") int offerId,
  );
}

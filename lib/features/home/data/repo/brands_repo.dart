import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';

part 'brands_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BrandRepo {
  factory BrandRepo(Dio dio, {String baseUrl}) = _BrandRepo;

  @GET(ApiConstants.brands)
  Future<BrandsModel> getAllBrand(
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.brands)
  Future<BrandsModel> getBrandById(
    @Query(ApiConstants.id) String id,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.brands)
  Future<BrandsModel> getBrandByDealershipId(
    @Query(ApiConstants.dealership) String dealershipId,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.brands)
  Future<BrandsModel> getBrandByCarId(
    @Query(ApiConstants.carId) String carId,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );
}

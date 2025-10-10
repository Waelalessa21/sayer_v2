import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/common/data/dealerships/model/dealerships_model.dart';

part 'dealership_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class DealershipRepo {
  factory DealershipRepo(Dio dio, {String baseUrl}) = _DealershipRepo;

  @GET("dealership")
  Future<DealershipsModel> getDealerships(
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @GET("dealership")
  Future<DealershipsModel> getDealershipsById(
    @Query("id") String id,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @GET("dealership")
  Future<DealershipsModel> getDealershipsByCarId(
    @Query("cars") String carId,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @GET("dealership")
  Future<DealershipsModel> getDealershipsByBrandId(
    @Query("brands") String brandId,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @GET("dealership")
  Future<DealershipsModel> getDealershipsByBrandAndCarId(
    @Query("brands") String brandId,
    @Query("cars") String carId,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );
}

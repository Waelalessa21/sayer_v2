import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

part 'car_offers_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CarOffersRepo {
  factory CarOffersRepo(Dio dio, {String baseUrl}) = _CarOffersRepo;

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffers(
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer + "/{id}")
  Future<CarOffersModel> getCarOffersById(
    @Path("id") String id,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersByDealershipId(
    @Query(ApiConstants.dealership) String dealershipId,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersByCarId(
    @Query(ApiConstants.carId) String carId,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersWithMonthlyPayment(
    @Query("monthly_payment") int monthlyPayment,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersByBrandId(
    @Query("brand_id") int brandId,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersByCarName(
    @Query("car_name") String carName,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );

  @GET(ApiConstants.carOffer)
  Future<CarOffersModel> getCarOffersByOfferName(
    @Query("offer_name") String offerName,
    @Query(ApiConstants.page) int page,
    @Query(ApiConstants.pageSize) int pageSize,
  );
}

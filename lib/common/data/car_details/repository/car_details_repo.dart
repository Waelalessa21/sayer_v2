import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/common/data/car_details/model/car_details_model.dart';

part 'car_details_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CarDetailsRepo {
  factory CarDetailsRepo(Dio dio, {String baseUrl}) = _CarDetailsRepo;

  // تفاصيل السيارة عن طريق ال id
  @GET("/car-details/{id}")
  Future<CarDetails> getCarDetailsById(@Path("id") int id);
}

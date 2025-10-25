import 'package:sayer_app/common/data/car_details/model/car_details_model.dart';
import 'package:sayer_app/common/data/car_details/repository/car_details_repo.dart';
import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';

class CarDetailsService {
  final CarDetailsRepo _carDetailsRepo;

  CarDetailsService(this._carDetailsRepo);

  Future<ApiResult<CarDetails>> getCarDetailsById(int id) async {
    try {
      final result = await _carDetailsRepo.getCarDetailsById(id);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

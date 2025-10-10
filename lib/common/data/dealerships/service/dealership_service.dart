import 'package:sayer_app/common/data/dealerships/model/dealerships_model.dart';
import 'package:sayer_app/common/data/dealerships/repo/dealership_repo.dart';
import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';

class DealershipService {
  final DealershipRepo _dealershipRepo;

  DealershipService(this._dealershipRepo);

  Future<ApiResult<DealershipsModel>> getDealerships(
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dealershipRepo.getDealerships(page, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DealershipsModel>> getDealershipsById(
    String id,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dealershipRepo.getDealershipsById(
        id,
        page,
        pageSize,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DealershipsModel>> getDealershipsByCarId(
    String carId,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dealershipRepo.getDealershipsByCarId(
        carId,
        page,
        pageSize,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DealershipsModel>> getDealershipsByBrandId(
    String brandId,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dealershipRepo.getDealershipsByBrandId(
        brandId,
        page,
        pageSize,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DealershipsModel>> getDealershipsByBrandAndCarId(
    String brandId,
    String carId,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dealershipRepo.getDealershipsByBrandAndCarId(
        brandId,
        carId,
        page,
        pageSize,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

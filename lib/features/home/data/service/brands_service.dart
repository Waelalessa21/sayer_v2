import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';
import 'package:sayer_app/features/home/data/repo/brands_repo.dart';

class BrandService {
  final BrandRepo _brandRepo;

  BrandService(this._brandRepo);

  Future<ApiResult<BrandsModel>> _handleApiCall(
    Future<BrandsModel> Function() apiCall,
    String functionName,
  ) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BrandsModel>> getBrands(int page, int pageSize) async {
    return _handleApiCall(
      () => _brandRepo.getAllBrand(page, pageSize),
      'getBrands',
    );
  }

  Future<ApiResult<BrandsModel>> getBrandsById(
    String id,
    int page,
    int pageSize,
  ) async {
    return _handleApiCall(
      () => _brandRepo.getBrandById(id, page, pageSize),
      'getBrandsById',
    );
  }

  Future<ApiResult<BrandsModel>> getBrandsByCarId(
    String carId,
    int page,
    int pageSize,
  ) async {
    return _handleApiCall(
      () => _brandRepo.getBrandByCarId(carId, page, pageSize),
      'getBrandsByCarId',
    );
  }

  Future<ApiResult<BrandsModel>> getBrandByDealershipId(
    String dealershipId,
    int page,
    int pageSize,
  ) async {
    return _handleApiCall(
      () => _brandRepo.getBrandByDealershipId(dealershipId, page, pageSize),
      'getBrandByDealershipId',
    );
  }
}

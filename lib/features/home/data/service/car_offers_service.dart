import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/features/home/data/repo/car_offers_repo.dart';

class CarOffersService {
  final CarOffersRepo _carOffersRepo;

  CarOffersService(this._carOffersRepo);

  Future<ApiResult<CarOffersModel>> _executeApiCall(
    Future<CarOffersModel> Function() apiCall,
    String functionName,
  ) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (error) {
      print('Error in $functionName: $error');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CarOffersModel>> getCarOffers(int page, int pageSize) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffers(page, pageSize),
      'getCarOffers',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersById(
    String id,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersById(id, page, pageSize),
      'getCarOffersById',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersByDealershipId(
    String dealershipId,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersByDealershipId(
        dealershipId,
        page,
        pageSize,
      ),
      'getCarOffersByDealershipId',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersByCarId(
    String carId,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersByCarId(carId, page, pageSize),
      'getCarOffersByCarId',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersWithMonthlyPayment(
    int monthlyPayment,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersWithMonthlyPayment(
        monthlyPayment,
        page,
        pageSize,
      ),
      'getCarOffersWithMonthlyPayment',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersByBrandId(
    int brandId,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersByBrandId(brandId, page, pageSize),
      'getCarOffersByBrandId',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersByCarName(
    String carName,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersByCarName(carName, page, pageSize),
      'getCarOffersByCarName',
    );
  }

  Future<ApiResult<CarOffersModel>> getCarOffersByOfferName(
    String offerName,
    int page,
    int pageSize,
  ) {
    return _executeApiCall(
      () => _carOffersRepo.getCarOffersByOfferName(offerName, page, pageSize),
      'getCarOffersByOfferName',
    );
  }
}

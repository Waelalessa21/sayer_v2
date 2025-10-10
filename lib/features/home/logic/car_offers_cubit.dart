import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/features/home/data/service/car_offers_service.dart';
import 'package:sayer_app/features/home/logic/car_offers_state.dart';

class CarOffersCubit extends Cubit<CarOffersState> {
  final CarOffersService _carOffersService;

  CarOffersCubit(this._carOffersService) : super(CarOffersState.initial());

  Future<void> _handleApiCall(
    Future<ApiResult<CarOffersModel>> Function() apiCall,
    String functionName,
  ) async {
    print('CarOffersCubit: Starting $functionName...');
    emit(CarOffersState.carOffersLoading());
    final response = await apiCall();
    response.when(
      success: (carOffersData) {
        print(
          'CarOffersCubit: Successfully fetched car offers: ${carOffersData.MostPoplerCars?.length ?? 0} offers',
        );
        emit(CarOffersState.carOffersSuccess(carOffersData.MostPoplerCars));
      },
      failure: (error) {
        print('CarOffersCubit: Error in $functionName: $error');
        emit(CarOffersState.carOffersError(error));
      },
    );
  }

  Future<void> getCarOffers(int page, int pageSize) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffers(page, pageSize),
      'getCarOffers',
    );
  }

  Future<void> getCarOffersById(String id, int page, int pageSize) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersById(id, page, pageSize),
      'getCarOffersById',
    );
  }

  Future<void> getCarOffersByDealershipId(
    String dealershipId,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersByDealershipId(
        dealershipId,
        page,
        pageSize,
      ),
      'getCarOffersByDealershipId',
    );
  }

  Future<void> getCarOffersByCarId(String carId, int page, int pageSize) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersByCarId(carId, page, pageSize),
      'getCarOffersByCarId',
    );
  }

  Future<void> getCarOffersWithMonthlyPayment(
    int monthlyPayment,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersWithMonthlyPayment(
        monthlyPayment,
        page,
        pageSize,
      ),
      'getCarOffersWithMonthlyPayment',
    );
  }

  Future<void> getCarOffersByBrandId(
    int brandId,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersByBrandId(brandId, page, pageSize),
      'getCarOffersByBrandId',
    );
  }

  Future<void> getCarOffersByCarName(
    String carName,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _carOffersService.getCarOffersByCarName(carName, page, pageSize),
      'getCarOffersByCarName',
    );
  }

  Future<void> getCarOffersByOfferName(
    String offerName,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () =>
          _carOffersService.getCarOffersByOfferName(offerName, page, pageSize),
      'getCarOffersByOfferName',
    );
  }

  Future<void> getCarOffersByOfferNameFilter(
    String offerName,
    int page,
    int pageSize,
  ) async {
    try {
      emit(CarOffersState.carOffersLoading());

      final response = await _carOffersService.getCarOffersByOfferName(
        offerName,
        page,
        pageSize,
      );

      response.when(
        success: (carOffersData) {
          emit(CarOffersState.carOffersSuccess(carOffersData.MostPoplerCars));
        },
        failure: (error) {
          print('Error in getCarOffersByOfferNameFilter: $error');
          emit(CarOffersState.carOffersError(error));
        },
      );
    } catch (error) {
      print('Exception in getCarOffersByOfferNameFilter: $error');
      emit(CarOffersState.carOffersError(ApiErrorModel(msg: 'حدث خطأ ما')));
    }
  }
}

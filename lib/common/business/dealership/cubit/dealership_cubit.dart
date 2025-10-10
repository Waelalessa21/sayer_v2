import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/business/dealership/cubit/dealership_state.dart';
import 'package:sayer_app/common/data/dealerships/service/dealership_service.dart';

class DealershipCubit extends Cubit<DealershipState> {
  final DealershipService _dealershipService;

  DealershipCubit(this._dealershipService)
    : super(const DealershipState.initial());

  Future<void> _handleApiCall(Future<dynamic> Function() apiCall) async {
    emit(const DealershipState.dealershipLoading());
    final response = await apiCall();
    response.when(
      success: (dealershipData) {
        emit(DealershipState.dealershipSuccess(dealershipData.dealership));
      },
      failure: (error) {
        emit(DealershipState.dealershipError(error));
      },
    );
  }

  Future<void> getDealerships(int page, int pageSize) async {
    await _handleApiCall(
      () => _dealershipService.getDealerships(page, pageSize),
    );
  }

  Future<void> getDealershipsById(String id, int page, int pageSize) async {
    await _handleApiCall(
      () => _dealershipService.getDealershipsById(id, page, pageSize),
    );
  }

  Future<void> getDealershipsByCarId(
    String carId,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _dealershipService.getDealershipsByCarId(carId, page, pageSize),
    );
  }

  Future<void> getDealershipsByBrandId(
    String brandId,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _dealershipService.getDealershipsByBrandId(brandId, page, pageSize),
    );
  }

  Future<void> getDealershipsByBrandIdAndCarId(
    String brandId,
    String carId,
    int page,
    int pageSize,
  ) async {
    await _handleApiCall(
      () => _dealershipService.getDealershipsByBrandAndCarId(
        brandId,
        carId,
        page,
        pageSize,
      ),
    );
  }
}

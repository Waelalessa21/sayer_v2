import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/data/car_details/service/car_details_service.dart';
import 'package:sayer_app/common/data/car_details/cubit/car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  final CarDetailsService _carDetailsService;

  CarDetailsCubit(this._carDetailsService) : super(CarDetailsState.initial());

  Future<void> _handleApiCall(
    Future<dynamic> Function() apiCall,
    String functionName,
  ) async {
    emit(CarDetailsState.loading());

    final response = await apiCall();

    response.when(
      success: (carDetailsData) {
        emit(CarDetailsState.success(carDetailsData));
      },
      failure: (error) {
        print('Error in $functionName: $error');
        emit(CarDetailsState.error(error));
      },
    );
  }

  // استدعاء تفاصيل السيارة عن طريق ID
  Future<void> getCarDetailsById(int id) async {
    await _handleApiCall(
      () => _carDetailsService.getCarDetailsById(id),
      'getCarDetailsById',
    );
  }
}

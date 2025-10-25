import 'package:equatable/equatable.dart';
import 'package:sayer_app/common/Networking/api_error_model.dart';
import 'package:sayer_app/common/data/car_details/model/car_details_model.dart';

class CarDetailsState extends Equatable {
  final bool isLoading;
  final CarDetails? data;
  final ApiErrorModel? error;

  const CarDetailsState({required this.isLoading, this.data, this.error});

  factory CarDetailsState.initial() {
    return const CarDetailsState(isLoading: false);
  }

  factory CarDetailsState.loading() {
    return const CarDetailsState(isLoading: true);
  }

  factory CarDetailsState.success(CarDetails data) {
    return CarDetailsState(isLoading: false, data: data);
  }

  factory CarDetailsState.error(ApiErrorModel error) {
    return CarDetailsState(isLoading: false, error: error);
  }

  @override
  List<Object?> get props => [isLoading, data, error];
}

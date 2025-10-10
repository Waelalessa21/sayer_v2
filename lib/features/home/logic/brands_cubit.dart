import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';
import 'package:sayer_app/features/home/data/service/brands_service.dart';
import 'package:sayer_app/features/home/logic/brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandService _brandService;

  List<BrandData?>? brandList = [];

  BrandsCubit(this._brandService) : super(BrandsState.initial());

  Future<void> _fetchBrands(
    Future<ApiResult<BrandsModel>> Function() apiCall,
  ) async {
    emit(BrandsState.loading());
    final response = await apiCall();
    response.when(
      success: (brandData) {
        brandList = brandData.brands ?? [];
        emit(BrandsState.success(brandList));
      },
      failure: (error) {
        emit(BrandsState.error(error));
      },
    );
  }

  void getBrands(int page, int pageSize) {
    _fetchBrands(() => _brandService.getBrands(page, pageSize));
  }

  void getBrandsById(String id, int page, int pageSize) {
    _fetchBrands(() => _brandService.getBrandsById(id, page, pageSize));
  }

  void getBrandsByCarId(String carId, int page, int pageSize) {
    _fetchBrands(() => _brandService.getBrandsByCarId(carId, page, pageSize));
  }

  void getBrandByDealershipId(String dealershipId, int page, int pageSize) {
    _fetchBrands(
      () => _brandService.getBrandByDealershipId(dealershipId, page, pageSize),
    );
  }
}

import 'package:sayer_app/features/home/data/model/brands_model.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

List<BrandData> extractBrandsWithOffers(List<CarOfferData?>? offers) {
  final Set<int> seenIds = {};
  final List<BrandData> result = [];

  if (offers == null) return result;

  for (final offer in offers) {
    final brand = offer?.car.brand_id;
    if (brand != null && !seenIds.contains(brand.id)) {
      seenIds.add(brand.id!);
      result.add(
        BrandData(
          id: brand.id,
          name: brand.name,
          description: brand.description,
        ),
      );
    }
  }

  return result;
}

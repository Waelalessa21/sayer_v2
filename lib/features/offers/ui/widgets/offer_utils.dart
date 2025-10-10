import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

List<Map<String, String>> extractRepeatedOffersWithShowroom(
  List<CarOfferData?>? items,
) {
  final Map<String, List<CarOfferData>> offerMap = {};
  final List<Map<String, String>> result = [];

  if (items == null) return result;

  for (var item in items) {
    if (item == null) continue;

    final offerName = item.name.trim();
    final showroomName = item.dealership.name?.trim() ?? '';

    if (offerName.isEmpty) continue;

    final key = '$offerName-$showroomName';
    offerMap.putIfAbsent(key, () => []);
    offerMap[key]!.add(item);
  }

  for (var entry in offerMap.entries) {
    if (entry.value.length > 1) {
      final firstItem = entry.value.first;
      final offerName = firstItem.name.trim();
      final showroomImage = firstItem.dealership.image_url ?? '';

      result.add({'offerName': offerName, 'showroomImage': showroomImage});
    }
  }

  return result;
}

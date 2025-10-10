import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/data/dealerships/model/dealerships_model.dart';

part 'car_offers_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CarOffersModel {
  int? count;
  @JsonKey(name: 'items')
  List<CarOfferData?>? MostPoplerCars;
  int? total;

  CarOffersModel({this.MostPoplerCars, this.count, this.total});

  factory CarOffersModel.fromJson(Map<String, dynamic> json) =>
      _$CarOffersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarOffersModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CarOfferData {
  final int id;
  final String name;
  @JsonKey(name: 'dealership_id')
  final DealershipData dealership;
  @JsonKey(name: 'car_id')
  final CarData car;
  @JsonKey(name: 'original_price')
  final double originalPrice;
  @JsonKey(name: 'monthly_payment')
  final double monthlyPayment;
  @JsonKey(name: 'discount_amount')
  final double discountAmount;
  @JsonKey(name: 'upfront_payment')
  final double upfrontPayment;
  @JsonKey(name: 'final_payment')
  final double finalPayment;
  @JsonKey(name: 'financed_by')
  final String? financedBy;
  @JsonKey(name: 'finance_length')
  final String? financeLength;
  @JsonKey(name: 'offer_feature_ids')
  final List<FeatureId> features;
  final List<ImageId> image_ids;
  final String? created_at;

  CarOfferData({
    required this.features,
    required this.image_ids,
    required this.id,
    required this.name,
    required this.dealership,
    required this.car,
    required this.originalPrice,
    required this.monthlyPayment,
    required this.discountAmount,
    required this.upfrontPayment,
    required this.finalPayment,
    this.financedBy,
    this.financeLength,
    this.created_at,
  });

  factory CarOfferData.fromJson(Map<String, dynamic> json) =>
      _$CarOfferDataFromJson(json);

  Map<String, dynamic> toJson() => _$CarOfferDataToJson(this);
}

@JsonSerializable()
class FeatureId {
  final String? key;
  final String? value;

  FeatureId({this.key, this.value});

  factory FeatureId.fromJson(Map<String, dynamic> json) =>
      _$FeatureIdFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureIdToJson(this);
}

@JsonSerializable()
class ImageId {
  @JsonKey(name: 'Id')
  final int? id;
  final String? public_url;

  ImageId({required this.id, required this.public_url});

  factory ImageId.fromJson(Map<String, dynamic> json) =>
      _$ImageIdFromJson(json);

  Map<String, dynamic> toJson() => _$ImageIdToJson(this);
}

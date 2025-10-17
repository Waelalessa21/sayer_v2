import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';

part 'cars_model.g.dart';

@JsonSerializable()
class CarModel {
  final int? count;
  final List<CarData?>? cars;
  final int? total;

  CarModel({this.count, this.cars, this.total});

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}

@JsonSerializable()
class CarData {
  final int? id;
  final BrandData? brand_id;
  final String? name;
  final String? description;
  final String? type;
  final String? model;
  final int? year;
  @JsonKey(name: 'car_type')
  final String? carType;
  @JsonKey(name: 'fuel_type')
  final String? fuelType;
  @JsonKey(name: 'fuel_economy_rate')
  final double? fuelEconomyRate;
  final String? color;
  final int? seats;
  final int? doors;
  final int? horsepower;
  final String? transmission;
  @JsonKey(name: 'image_url')
  final String? image_url;
  @JsonKey(name: 'image_ids')
  final List<ImageId>? imageIds;
  @JsonKey(name: 'feature_ids')
  final List<FeatureId>? featureIds;
  final bool? active;

  CarData({
    this.brand_id,
    this.description,
    this.id,
    this.name,
    this.type,
    this.model,
    this.year,
    this.carType,
    this.fuelType,
    this.fuelEconomyRate,
    this.color,
    this.seats,
    this.doors,
    this.horsepower,
    this.transmission,
    this.image_url,
    this.imageIds,
    this.featureIds,
    this.active,
  });

  factory CarData.fromJson(Map<String, dynamic> json) =>
      _$CarDataFromJson(json);

  Map<String, dynamic> toJson() => _$CarDataToJson(this);
}

@JsonSerializable()
class ImageId {
  @JsonKey(name: 'Id')
  final int? id;
  final String? public_url;

  ImageId({this.id, this.public_url});

  factory ImageId.fromJson(Map<String, dynamic> json) =>
      _$ImageIdFromJson(json);

  Map<String, dynamic> toJson() => _$ImageIdToJson(this);
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

import 'package:json_annotation/json_annotation.dart';

part 'cars_model.g.dart';

@JsonSerializable()
class CarData {
  final int? id;
  final String? name;
  @JsonKey(name: 'brand_id')
  final SimpleBrandData? brand_id;
  final String? description;
  final String? model;
  final int? year;
  final String? country;
  @JsonKey(name: 'seats_number')
  final int? seatsNumber;
  @JsonKey(name: 'doors_number')
  final int? doorsNumber;
  @JsonKey(name: 'car_type')
  final String? carType;
  @JsonKey(name: 'fuel_type')
  final String? fuelType;
  @JsonKey(name: 'fuel_economy_rate')
  final double? fuelEconomyRate;
  final String? color;
  final int? horsepower;
  final String? transmission;
  @JsonKey(name: 'archived')
  final bool? archived;
  @JsonKey(name: 'sequence')
  final int? sequence;
  @JsonKey(name: 'feature_ids')
  final List<CarFeature>? features;

  CarData({
    this.id,
    this.name,
    this.brand_id,
    this.description,
    this.model,
    this.year,
    this.country,
    this.seatsNumber,
    this.doorsNumber,
    this.carType,
    this.fuelType,
    this.fuelEconomyRate,
    this.color,
    this.horsepower,
    this.transmission,
    this.archived,
    this.sequence,
    this.features,
  });

  factory CarData.fromJson(Map<String, dynamic> json) =>
      _$CarDataFromJson(json);

  Map<String, dynamic> toJson() => _$CarDataToJson(this);
}

@JsonSerializable()
class SimpleBrandData {
  final int? id;
  final String? name;
  final String? description;

  SimpleBrandData({this.id, this.name, this.description});

  factory SimpleBrandData.fromJson(Map<String, dynamic> json) =>
      _$SimpleBrandDataFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleBrandDataToJson(this);
}

@JsonSerializable()
class CarFeature {
  final String? key;

  @JsonKey(name: 'value')
  final String? featureValue;

  CarFeature({this.key, this.featureValue});

  factory CarFeature.fromJson(Map<String, dynamic> json) =>
      _$CarFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$CarFeatureToJson(this);
}

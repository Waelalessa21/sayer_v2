// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarData _$CarDataFromJson(Map<String, dynamic> json) => CarData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  brand_id: json['brand_id'] == null
      ? null
      : SimpleBrandData.fromJson(json['brand_id'] as Map<String, dynamic>),
  description: json['description'] as String?,
  model: json['model'] as String?,
  year: (json['year'] as num?)?.toInt(),
  country: json['country'] as String?,
  seatsNumber: (json['seats_number'] as num?)?.toInt(),
  doorsNumber: (json['doors_number'] as num?)?.toInt(),
  carType: json['car_type'] as String?,
  fuelType: json['fuel_type'] as String?,
  fuelEconomyRate: (json['fuel_economy_rate'] as num?)?.toDouble(),
  color: json['color'] as String?,
  horsepower: (json['horsepower'] as num?)?.toInt(),
  transmission: json['transmission'] as String?,
  archived: json['archived'] as bool?,
  sequence: (json['sequence'] as num?)?.toInt(),
  features: (json['feature_ids'] as List<dynamic>?)
      ?.map((e) => CarFeature.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CarDataToJson(CarData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'brand_id': instance.brand_id,
  'description': instance.description,
  'model': instance.model,
  'year': instance.year,
  'country': instance.country,
  'seats_number': instance.seatsNumber,
  'doors_number': instance.doorsNumber,
  'car_type': instance.carType,
  'fuel_type': instance.fuelType,
  'fuel_economy_rate': instance.fuelEconomyRate,
  'color': instance.color,
  'horsepower': instance.horsepower,
  'transmission': instance.transmission,
  'archived': instance.archived,
  'sequence': instance.sequence,
  'feature_ids': instance.features,
};

SimpleBrandData _$SimpleBrandDataFromJson(Map<String, dynamic> json) =>
    SimpleBrandData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SimpleBrandDataToJson(SimpleBrandData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

CarFeature _$CarFeatureFromJson(Map<String, dynamic> json) => CarFeature(
  key: json['key'] as String?,
  featureValue: json['value'] as String?,
);

Map<String, dynamic> _$CarFeatureToJson(CarFeature instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.featureValue};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
  count: (json['count'] as num?)?.toInt(),
  cars: (json['cars'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : CarData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
  'count': instance.count,
  'cars': instance.cars,
  'total': instance.total,
};

CarData _$CarDataFromJson(Map<String, dynamic> json) => CarData(
  brand_id: json['brand_id'] == null
      ? null
      : BrandData.fromJson(json['brand_id'] as Map<String, dynamic>),
  description: json['description'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
  model: json['model'] as String?,
  year: (json['year'] as num?)?.toInt(),
  carType: json['car_type'] as String?,
  fuelType: json['fuel_type'] as String?,
  fuelEconomyRate: (json['fuel_economy_rate'] as num?)?.toDouble(),
  color: json['color'] as String?,
  seats: (json['seats'] as num?)?.toInt(),
  doors: (json['doors'] as num?)?.toInt(),
  horsepower: (json['horsepower'] as num?)?.toInt(),
  transmission: json['transmission'] as String?,
  image_url: json['image_url'] as String?,
  imageIds: (json['image_ids'] as List<dynamic>?)
      ?.map((e) => ImageId.fromJson(e as Map<String, dynamic>))
      .toList(),
  featureIds: (json['feature_ids'] as List<dynamic>?)
      ?.map((e) => FeatureId.fromJson(e as Map<String, dynamic>))
      .toList(),
  active: json['active'] as bool?,
);

Map<String, dynamic> _$CarDataToJson(CarData instance) => <String, dynamic>{
  'id': instance.id,
  'brand_id': instance.brand_id,
  'name': instance.name,
  'description': instance.description,
  'type': instance.type,
  'model': instance.model,
  'year': instance.year,
  'car_type': instance.carType,
  'fuel_type': instance.fuelType,
  'fuel_economy_rate': instance.fuelEconomyRate,
  'color': instance.color,
  'seats': instance.seats,
  'doors': instance.doors,
  'horsepower': instance.horsepower,
  'transmission': instance.transmission,
  'image_url': instance.image_url,
  'image_ids': instance.imageIds,
  'feature_ids': instance.featureIds,
  'active': instance.active,
};

ImageId _$ImageIdFromJson(Map<String, dynamic> json) => ImageId(
  id: (json['Id'] as num?)?.toInt(),
  public_url: json['public_url'] as String?,
);

Map<String, dynamic> _$ImageIdToJson(ImageId instance) => <String, dynamic>{
  'Id': instance.id,
  'public_url': instance.public_url,
};

FeatureId _$FeatureIdFromJson(Map<String, dynamic> json) =>
    FeatureId(key: json['key'] as String?, value: json['value'] as String?);

Map<String, dynamic> _$FeatureIdToJson(FeatureId instance) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
};

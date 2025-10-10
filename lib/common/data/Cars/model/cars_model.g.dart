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
);

Map<String, dynamic> _$CarDataToJson(CarData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'brand_id': instance.brand_id,
  'description': instance.description,
  'model': instance.model,
  'year': instance.year,
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

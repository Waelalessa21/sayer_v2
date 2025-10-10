// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandsModel _$BrandsModelFromJson(Map<String, dynamic> json) => BrandsModel(
  brands: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : BrandData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  count: (json['count'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$BrandsModelToJson(BrandsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.brands,
      'total': instance.total,
    };

BrandData _$BrandDataFromJson(Map<String, dynamic> json) => BrandData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  image_url: json['image_url'] as String?,
  imageIds: (json['image_ids'] as List<dynamic>?)
      ?.map((e) => ImageId.fromJson(e as Map<String, dynamic>))
      .toList(),
  carIds: (json['car_ids'] as List<dynamic>?)
      ?.map((e) => CarData.fromJson(e as Map<String, dynamic>))
      .toList(),
  sequence: (json['sequence'] as num?)?.toInt(),
);

Map<String, dynamic> _$BrandDataToJson(BrandData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image_url': instance.image_url,
  'image_ids': instance.imageIds,
  'car_ids': instance.carIds,
  'sequence': instance.sequence,
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

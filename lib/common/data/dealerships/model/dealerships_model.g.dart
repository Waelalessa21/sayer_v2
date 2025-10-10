// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealerships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealershipsModel _$DealershipsModelFromJson(Map<String, dynamic> json) =>
    DealershipsModel(
      count: (json['count'] as num?)?.toInt(),
      dealership: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : DealershipData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DealershipsModelToJson(DealershipsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.dealership,
      'total': instance.total,
    };

DealershipData _$DealershipDataFromJson(Map<String, dynamic> json) =>
    DealershipData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      street: json['street'] as String?,
      street2: json['street2'] as String?,
      zip: json['zip'] as String?,
      city: json['city'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      vat: json['vat'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DealershipDataToJson(DealershipData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'street': instance.street,
      'street2': instance.street2,
      'zip': instance.zip,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'vat': instance.vat,
      'image_url': instance.image_url,
    };

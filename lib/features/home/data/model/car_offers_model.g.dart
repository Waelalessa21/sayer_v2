// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarOffersModel _$CarOffersModelFromJson(Map<String, dynamic> json) =>
    CarOffersModel(
      MostPoplerCars: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CarOfferData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CarOffersModelToJson(CarOffersModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.MostPoplerCars?.map((e) => e?.toJson()).toList(),
      'total': instance.total,
    };

CarOfferData _$CarOfferDataFromJson(Map<String, dynamic> json) => CarOfferData(
  features: (json['offer_feature_ids'] as List<dynamic>)
      .map((e) => FeatureId.fromJson(e as Map<String, dynamic>))
      .toList(),
  image_ids: (json['image_ids'] as List<dynamic>)
      .map((e) => ImageId.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  dealership: DealershipData.fromJson(
    json['dealership_id'] as Map<String, dynamic>,
  ),
  car: CarData.fromJson(json['car_id'] as Map<String, dynamic>),
  originalPrice: (json['original_price'] as num).toDouble(),
  monthlyPayment: (json['monthly_payment'] as num).toDouble(),
  discountAmount: (json['discount_amount'] as num).toDouble(),
  upfrontPayment: (json['upfront_payment'] as num).toDouble(),
  finalPayment: (json['final_payment'] as num).toDouble(),
  financedBy: json['financed_by'] as String?,
  financeLength: json['finance_length'] as String?,
  created_at: json['created_at'] as String?,
);

Map<String, dynamic> _$CarOfferDataToJson(CarOfferData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dealership_id': instance.dealership.toJson(),
      'car_id': instance.car.toJson(),
      'original_price': instance.originalPrice,
      'monthly_payment': instance.monthlyPayment,
      'discount_amount': instance.discountAmount,
      'upfront_payment': instance.upfrontPayment,
      'final_payment': instance.finalPayment,
      'financed_by': instance.financedBy,
      'finance_length': instance.financeLength,
      'offer_feature_ids': instance.features.map((e) => e.toJson()).toList(),
      'image_ids': instance.image_ids.map((e) => e.toJson()).toList(),
      'created_at': instance.created_at,
    };

FeatureId _$FeatureIdFromJson(Map<String, dynamic> json) =>
    FeatureId(key: json['key'] as String?, value: json['value'] as String?);

Map<String, dynamic> _$FeatureIdToJson(FeatureId instance) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
};

ImageId _$ImageIdFromJson(Map<String, dynamic> json) => ImageId(
  id: (json['Id'] as num?)?.toInt(),
  public_url: json['public_url'] as String?,
);

Map<String, dynamic> _$ImageIdToJson(ImageId instance) => <String, dynamic>{
  'Id': instance.id,
  'public_url': instance.public_url,
};

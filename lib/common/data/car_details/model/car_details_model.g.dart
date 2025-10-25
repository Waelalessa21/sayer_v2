// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetails _$CarDetailsFromJson(Map<String, dynamic> json) => CarDetails(
  id: (json['id'] as num).toInt(),
  car: CarData.fromJson(json['car'] as Map<String, dynamic>),
  price: (json['price'] as num).toDouble(),
  priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
  monthlyPayment: (json['monthly_payment'] as num?)?.toDouble(),
  description: json['description'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  fuelConsumption: (json['fuel_consumption'] as num?)?.toDouble(),
  categoryName: json['category_name'] as String?,
);

Map<String, dynamic> _$CarDetailsToJson(CarDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car': instance.car,
      'price': instance.price,
      'price_after_discount': instance.priceAfterDiscount,
      'monthly_payment': instance.monthlyPayment,
      'description': instance.description,
      'images': instance.images,
      'fuel_consumption': instance.fuelConsumption,
      'category_name': instance.categoryName,
    };

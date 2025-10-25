import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';

part 'car_details_model.g.dart';

@JsonSerializable()
class CarDetails {
  final int id;
  final CarData car;

  @JsonKey(name: 'original_price')
  final double price;

  @JsonKey(name: 'price_after_discount')
  final double? priceAfterDiscount;

  @JsonKey(name: 'monthly_payment')
  final double? monthlyPayment;

  @JsonKey(name: 'discount_amount')
  final double? discountAmount;

  @JsonKey(name: 'upfront_payment')
  final double? upfrontPayment;

  @JsonKey(name: 'final_payment')
  final double? finalPayment;

  @JsonKey(name: 'financed_by_whom')
  final String? financedByWhom;

  @JsonKey(name: 'finance_length')
  final String? financeLength;

  final String? description;

  final List<String>? images;

  @JsonKey(name: 'fuel_consumption')
  final double? fuelConsumption;

  @JsonKey(name: 'category_name')
  final String? categoryName;

  CarDetails({
    required this.id,
    required this.car,
    required this.price,
    this.priceAfterDiscount,
    this.monthlyPayment,
    this.discountAmount,
    this.upfrontPayment,
    this.finalPayment,
    this.financedByWhom,
    this.financeLength,
    this.description,
    this.images,
    this.fuelConsumption,
    this.categoryName,
  });

  factory CarDetails.fromJson(Map<String, dynamic> json) =>
      _$CarDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CarDetailsToJson(this);
}

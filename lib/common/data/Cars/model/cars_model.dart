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

  CarData({
    this.id,
    this.name,
    this.brand_id,
    this.description,
    this.model,
    this.year,
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

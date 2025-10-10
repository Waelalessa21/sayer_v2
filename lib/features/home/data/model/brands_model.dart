import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';

part 'brands_model.g.dart';

@JsonSerializable()
class BrandsModel {
  int? count;
  @JsonKey(name: 'items')
  List<BrandData?>? brands;
  int? total;

  BrandsModel({this.brands, this.count, this.total});

  factory BrandsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsModelFromJson(json);
}

@JsonSerializable()
class BrandData {
  int? id;
  String? name;
  String? description;
  String? image_url;
  @JsonKey(name: 'image_ids')
  List<ImageId>? imageIds;
  @JsonKey(name: 'car_ids')
  List<CarData>? carIds;
  int? sequence;

  BrandData({
    this.id,
    this.name,
    this.description,
    this.image_url,
    this.imageIds,
    this.carIds,
    this.sequence,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);
}

@JsonSerializable()
class ImageId {
  @JsonKey(name: 'Id')
  final int? id;
  final String? public_url;

  ImageId({this.id, this.public_url});

  factory ImageId.fromJson(Map<String, dynamic> json) =>
      _$ImageIdFromJson(json);

  Map<String, dynamic> toJson() => _$ImageIdToJson(this);
}

@JsonSerializable()
class FeatureId {
  String? key;
  String? value;

  FeatureId({this.key, this.value});

  factory FeatureId.fromJson(Map<String, dynamic> json) =>
      _$FeatureIdFromJson(json);
}


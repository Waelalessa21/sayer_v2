import 'package:json_annotation/json_annotation.dart';

part 'dealerships_model.g.dart';

@JsonSerializable()
class DealershipsModel {
  final int? count;
  @JsonKey(name: 'items')
  final List<DealershipData?>? dealership;
  final int? total;

  DealershipsModel({this.count, this.dealership, this.total});

  factory DealershipsModel.fromJson(Map<String, dynamic> json) =>
      _$DealershipsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealershipsModelToJson(this);
}

@JsonSerializable()
class DealershipData {
  final int? id;
  final String? name;
  final String? street;
  final String? street2;
  final String? zip;
  final String? city;
  final double? latitude;
  final double? longitude;
  final String? phone;
  final String? mobile;
  final String? vat;
  final String? image_url;

  DealershipData({
    this.id,
    this.name,
    this.street,
    this.street2,
    this.zip,
    this.city,
    this.latitude,
    this.longitude,
    this.phone,
    this.mobile,
    this.vat,
    this.image_url,
  });

  factory DealershipData.fromJson(Map<String, dynamic> json) =>
      _$DealershipDataFromJson(json);

  Map<String, dynamic> toJson() => _$DealershipDataToJson(this);
}

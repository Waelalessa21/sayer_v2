import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  String? phone;
  String? activeKey;

  OtpModel({this.phone, this.activeKey});

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}

@JsonSerializable()
class OtpResponseModel {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'token_type')
  String? tokenType;

  OtpResponseModel({this.accessToken, this.tokenType});

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseModelToJson(this);
}

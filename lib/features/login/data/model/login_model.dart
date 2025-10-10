import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? phone;

  LoginModel({this.phone});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class GenerateOtpResponseModel {
  @JsonKey(name: 'Message')
  String? message;

  GenerateOtpResponseModel({this.message});

  factory GenerateOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateOtpResponseModelToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) =>
    LoginModel(phone: json['phone'] as String?);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{'phone': instance.phone};

GenerateOtpResponseModel _$GenerateOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => GenerateOtpResponseModel(message: json['Message'] as String?);

Map<String, dynamic> _$GenerateOtpResponseModelToJson(
  GenerateOtpResponseModel instance,
) => <String, dynamic>{'Message': instance.message};

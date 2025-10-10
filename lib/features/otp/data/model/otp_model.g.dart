// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) => OtpModel(
  phone: json['phone'] as String?,
  activeKey: json['activeKey'] as String?,
);

Map<String, dynamic> _$OtpModelToJson(OtpModel instance) => <String, dynamic>{
  'phone': instance.phone,
  'activeKey': instance.activeKey,
};

OtpResponseModel _$OtpResponseModelFromJson(Map<String, dynamic> json) =>
    OtpResponseModel(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
    );

Map<String, dynamic> _$OtpResponseModelToJson(OtpResponseModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };

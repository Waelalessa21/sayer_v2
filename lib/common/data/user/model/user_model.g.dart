// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{'items': instance.items};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phoneNumber: json['phone_number'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
};

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
    };

UserCreateModel _$UserCreateModelFromJson(Map<String, dynamic> json) =>
    UserCreateModel(phoneNumber: json['phone_number'] as String?);

Map<String, dynamic> _$UserCreateModelToJson(UserCreateModel instance) =>
    <String, dynamic>{'phone_number': instance.phoneNumber};

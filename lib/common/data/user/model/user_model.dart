import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResponse {
  List<UserModel>? items;

  UserResponse({this.items});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  UserModel({this.id, this.firstName, this.lastName, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserUpdateModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  UserUpdateModel({
    this.id,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}

@JsonSerializable()
class UserCreateModel {
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  UserCreateModel({this.phoneNumber});

  factory UserCreateModel.fromJson(Map<String, dynamic> json) =>
      _$UserCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateModelToJson(this);
}

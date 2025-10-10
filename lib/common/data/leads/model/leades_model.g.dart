// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leades_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadesModel _$LeadesModelFromJson(Map<String, dynamic> json) => LeadesModel(
  count: (json['count'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => LeadesData.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$LeadesModelToJson(LeadesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
      'total': instance.total,
    };

LeadesData _$LeadesDataFromJson(Map<String, dynamic> json) => LeadesData(
  name: json['name'] as String?,
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  contactName: json['contact_name'] as String?,
  phone: json['phone'] as String?,
  sayerUserId: json['sayer_user_id'] == null
      ? null
      : UserModel.fromJson(json['sayer_user_id'] as Map<String, dynamic>),
  stageId: json['stage_id'] == null
      ? null
      : Stage.fromJson(json['stage_id'] as Map<String, dynamic>),
  car_name: json['car_name'] as String?,
  car_id: (json['car_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$LeadesDataToJson(LeadesData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'contact_name': instance.contactName,
      'phone': instance.phone,
      'sayer_user_id': instance.sayerUserId,
      'stage_id': instance.stageId,
      'car_name': instance.car_name,
      'car_id': instance.car_id,
    };

Stage _$StageFromJson(Map<String, dynamic> json) =>
    Stage(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

LeadesModelPOST _$LeadesModelPOSTFromJson(Map<String, dynamic> json) =>
    LeadesModelPOST(
      offer_id: (json['offer_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeadesModelPOSTToJson(LeadesModelPOST instance) =>
    <String, dynamic>{
      'offer_id': instance.offer_id,
      'user_id': instance.user_id,
    };

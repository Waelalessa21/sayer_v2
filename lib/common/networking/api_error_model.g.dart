// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      loc: (json['detail'] as List<dynamic>?)
          ?.map((e) => Loc.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'detail': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };

Loc _$LocFromJson(Map<String, dynamic> json) =>
    Loc(key: json['key'] as String?, index: (json['index'] as num?)?.toInt());

Map<String, dynamic> _$LocToJson(Loc instance) => <String, dynamic>{
  'key': instance.key,
  'index': instance.index,
};

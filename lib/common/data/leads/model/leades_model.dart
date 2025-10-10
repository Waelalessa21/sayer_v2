import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/common/data/user/model/user_model.dart';

part 'leades_model.g.dart';

@JsonSerializable()
class LeadesModel {
  final int? count;
  final List<LeadesData>? items;
  final int? total;

  LeadesModel({this.count, this.items, this.total});

  factory LeadesModel.fromJson(Map<String, dynamic> json) =>
      _$LeadesModelFromJson(json);
  Map<String, dynamic> toJson() => _$LeadesModelToJson(this);
}

@JsonSerializable()
class LeadesData {
  final String? name;
  final int? id;
  final String? email;
  @JsonKey(name: 'contact_name')
  final String? contactName;
  final String? phone;
  @JsonKey(name: 'sayer_user_id')
  final UserModel? sayerUserId;
  @JsonKey(name: 'stage_id')
  final Stage? stageId;
  final String? car_name;
  final int? car_id;

  LeadesData({
    this.name,
    this.id,
    this.email,
    this.contactName,
    this.phone,
    this.sayerUserId,
    this.stageId,
    this.car_name,
    this.car_id,
  });

  factory LeadesData.fromJson(Map<String, dynamic> json) =>
      _$LeadesDataFromJson(json);
  Map<String, dynamic> toJson() => _$LeadesDataToJson(this);
}

@JsonSerializable()
class Stage {
  final int? id;
  final String? name;

  Stage({this.id, this.name});

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
  Map<String, dynamic> toJson() => _$StageToJson(this);
}

@JsonSerializable()
class LeadesModelPOST {
  final int? offer_id;
  final int? user_id;

  LeadesModelPOST({this.offer_id, this.user_id});

  factory LeadesModelPOST.fromJson(Map<String, dynamic> json) =>
      _$LeadesModelPOSTFromJson(json);
  Map<String, dynamic> toJson() => _$LeadesModelPOSTToJson(this);
}

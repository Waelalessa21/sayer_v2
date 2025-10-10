import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: 'detail')
  final List<Loc>? loc;
  final String? msg;
  final String? type;

  ApiErrorModel({this.loc, this.msg, this.type});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class Loc {
  final String? key;
  final int? index;

  Loc({this.key, this.index});

  factory Loc.fromJson(Map<String, dynamic> json) => _$LocFromJson(json);

  Map<String, dynamic> toJson() => _$LocToJson(this);
}

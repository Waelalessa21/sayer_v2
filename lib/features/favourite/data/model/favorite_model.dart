import 'package:json_annotation/json_annotation.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  int? count;
  List<FavoriteOfferModel>? items;
  int? total;

  FavoritesModel({this.count, this.items, this.total});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritesModelToJson(this);
}

@JsonSerializable()
class FavoriteOfferModel {
  @JsonKey(name: 'offer_id')
  CarOfferData? offerId;

  FavoriteOfferModel({this.offerId});

  factory FavoriteOfferModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteOfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteOfferModelToJson(this);
}

@JsonSerializable()
class FavoriteModelPOST {
  @JsonKey(name: 'user_id')
  int user_id;
  @JsonKey(name: 'offer_id')
  int offer_id;

  FavoriteModelPOST({required this.user_id, required this.offer_id});

  factory FavoriteModelPOST.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelPOSTFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteModelPOSTToJson(this);
}

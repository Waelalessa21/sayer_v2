// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) =>
    FavoritesModel(
      count: (json['count'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FavoriteOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoritesModelToJson(FavoritesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
      'total': instance.total,
    };

FavoriteOfferModel _$FavoriteOfferModelFromJson(Map<String, dynamic> json) =>
    FavoriteOfferModel(
      offerId: json['offer_id'] == null
          ? null
          : CarOfferData.fromJson(json['offer_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteOfferModelToJson(FavoriteOfferModel instance) =>
    <String, dynamic>{'offer_id': instance.offerId};

FavoriteModelPOST _$FavoriteModelPOSTFromJson(Map<String, dynamic> json) =>
    FavoriteModelPOST(
      user_id: (json['user_id'] as num).toInt(),
      offer_id: (json['offer_id'] as num).toInt(),
    );

Map<String, dynamic> _$FavoriteModelPOSTToJson(FavoriteModelPOST instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'offer_id': instance.offer_id,
    };

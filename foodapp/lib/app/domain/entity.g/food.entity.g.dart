// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/food.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodEntity _$FoodEntityFromJson(Map<String, dynamic> json) => FoodEntity(
      id: json['id'] as int?,
      restaurantId: json['restaurantId'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      details: json['details'] as String?,
      image: json['image'] as String?,
      quantity: json['quantity'] as int?,
      sold: json['sold'] as int?,
      startSell: _$JsonConverterFromJson<String, DateTime>(
          json['startSell'], const JsonSerializableDateTime().fromJson),
      endSell: _$JsonConverterFromJson<String, DateTime>(
          json['endSell'], const JsonSerializableDateTime().fromJson),
      categoryId: json['categoryId'] as int?,
      rating: json['rating'] as num?,
      totalRating: json['totalRating'] as int?,
    );

Map<String, dynamic> _$FoodEntityToJson(FoodEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'price': instance.price,
      'details': instance.details,
      'image': instance.image,
      'quantity': instance.quantity,
      'sold': instance.sold,
      'startSell': _$JsonConverterToJson<String, DateTime>(
          instance.startSell, const JsonSerializableDateTime().toJson),
      'endSell': _$JsonConverterToJson<String, DateTime>(
          instance.endSell, const JsonSerializableDateTime().toJson),
      'categoryId': instance.categoryId,
      'rating': instance.rating,
      'totalRating': instance.totalRating,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

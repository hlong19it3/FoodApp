import 'package:foodapp/app/core/utils/datetime.util.dart';
import 'package:json_annotation/json_annotation.dart';

part '../entity.g/food.entity.g.dart';

@JsonSerializable()
@JsonSerializableDateTime()
class FoodEntity {
  int? id;
  int? restaurantId;
  String? name;
  int? price;
  String? details;
  String? image;
  int? quantity;
  int? sold;
  DateTime? startSell;
  DateTime? endSell;
  int? categoryId;
  num? rating;
  int? totalRating;

  FoodEntity(
      {this.id,
      this.restaurantId,
      this.name,
      this.price,
      this.details,
      this.image,
      this.quantity,
      this.sold,
      this.startSell,
      this.endSell,
      this.categoryId,
      this.rating,
      this.totalRating});

  factory FoodEntity.fromJson(Map<String, dynamic> json) {
    return _$FoodEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FoodEntityToJson(this);
}

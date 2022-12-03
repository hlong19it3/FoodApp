import 'package:json_annotation/json_annotation.dart';

part 'category.entity.g.dart';

@JsonSerializable()
class CategoryEntity {
  int? id;
  String? name;
  String? image;
  CategoryEntity({
    this.id,
    this.name,
    this.image
  });
  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return _$CategoryEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}

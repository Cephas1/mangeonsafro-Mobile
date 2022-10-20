import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_category.g.dart';

@JsonSerializable()
class ShopCategory {
  int? id;
  String? name;
  String? description;
  String? image;
  String? isActive;
  String? createdAt;
  String? updateAt;

  ShopCategory({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.isActive,
    @required this.createdAt,
    @required this.updateAt
  });

  factory ShopCategory.fromJson(Map<String, dynamic> json) => _$ShopCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ShopCategoryToJson(this);
}
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  int? id;
  String? name;
  String? description;
  String? active;
  String? createdAt;
  String? updateAt;

  ProductCategory({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.active,
    @required this.createdAt,
    @required this.updateAt
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
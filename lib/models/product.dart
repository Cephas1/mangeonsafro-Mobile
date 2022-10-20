import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? description;
  String? active;
  String? price;
  String? shop_id;
  String? createdAt;
  String? updateAt;

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.active,
    @required this.price,
    @required this.shop_id,
    @required this.createdAt,
    @required this.updateAt
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
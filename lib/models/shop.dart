import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop {
  int? id;
  String? name;
  String? description;
  String? website;
  String? email;
  String? phone;
  String? shopCategoryID;
  String? createdAt;
  String? updateAt;

  Shop({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.website,
    @required this.email,
    @required this.phone,
    @required this.shopCategoryID,
    @required this.createdAt,
    @required this.updateAt
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
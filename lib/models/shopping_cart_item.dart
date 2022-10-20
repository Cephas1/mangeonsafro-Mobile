import 'package:json_annotation/json_annotation.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/shop.dart';

part 'shopping_cart_item.g.dart';

@JsonSerializable()
class ShoppingCartItem {
  int? quantity;
  Product? product;
  Shop? shop;

  ShoppingCartItem({
    required this.quantity,
    required this.product,
    required this.shop
  });

  factory ShoppingCartItem.fromJson(Map<String, dynamic> json) => _$ShoppingCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingCartItemToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartItem _$ShoppingCartItemFromJson(Map<String, dynamic> json) =>
    ShoppingCartItem(
      quantity: json['quantity'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      shop: Shop.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingCartItemToJson(ShoppingCartItem instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'product': instance.product,
      'shop': instance.shop,
    };

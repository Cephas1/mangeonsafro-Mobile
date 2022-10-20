// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCategory _$ShopCategoryFromJson(Map<String, dynamic> json) => ShopCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isActive: json['isActive'] as String?,
      createdAt: json['createdAt'] as String?,
      updateAt: json['updateAt'] as String?,
    );

Map<String, dynamic> _$ShopCategoryToJson(ShopCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
    };

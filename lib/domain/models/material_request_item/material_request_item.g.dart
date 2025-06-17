// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestItem _$MaterialRequestItemFromJson(Map<String, dynamic> json) =>
    MaterialRequestItem(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      unit: json['unit'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      catId: json['cat_id'] as String?,
      categoryName: json['category_name'] as String?,
      productCategory: json['product_category'] as String?,
      brandName: json['brand_name'] as String?,
    );

Map<String, dynamic> _$MaterialRequestItemToJson(
        MaterialRequestItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'cat_id': instance.catId,
      'category_name': instance.categoryName,
      'brand_name': instance.brandName,
      'product_category': instance.productCategory,
    };

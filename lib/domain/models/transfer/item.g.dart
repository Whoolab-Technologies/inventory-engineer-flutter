// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      unit: json['unit'] as String?,
      requestedQuantity: (json['requested_quantity'] as num?)?.toInt(),
      issuedQuantity: (json['issued_quantity'] as num?)?.toInt(),
      receivedQuantity: (json['received_quantity'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      productCategory: json['product_category'] as String?,
      brandName: json['brand_name'] as String?,
      categoryId: json['category_id'] as String?,
      catId: json['cat_id'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'unit': instance.unit,
      'requested_quantity': instance.requestedQuantity,
      'issued_quantity': instance.issuedQuantity,
      'received_quantity': instance.receivedQuantity,
      'category_id': instance.categoryId,
      'cat_id': instance.catId,
      'category_name': instance.categoryName,
      'brand_name': instance.brandName,
      'product_category': instance.productCategory,
    };

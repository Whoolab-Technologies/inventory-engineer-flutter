// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialReturnItem _$MaterialReturnItemFromJson(Map<String, dynamic> json) =>
    MaterialReturnItem(
      id: (json['id'] as num?)?.toInt(),
      materialReturnId: (json['material_return_id'] as num?)?.toInt(),
      materialReturnDetailId:
          (json['material_return_detail_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      issued: (json['issued'] as num?)?.toInt(),
      received: (json['received'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialReturnItemToJson(MaterialReturnItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'material_return_id': instance.materialReturnId,
      'material_return_detail_id': instance.materialReturnDetailId,
      'product_id': instance.productId,
      'product': instance.product,
      'issued': instance.issued,
      'received': instance.received,
    };

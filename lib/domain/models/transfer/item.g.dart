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
    };

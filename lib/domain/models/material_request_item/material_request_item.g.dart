// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestItem _$MaterialRequestItemFromJson(Map<String, dynamic> json) =>
    MaterialRequestItem(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_ame'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialRequestItemToJson(
        MaterialRequestItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_ame': instance.productName,
      'quantity': instance.quantity,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestItem _$MaterialRequestItemFromJson(Map<String, dynamic> json) =>
    MaterialRequestItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$MaterialRequestItemToJson(
        MaterialRequestItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'quantity': instance.quantity,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String?,
      itemDescription: json['item_description'],
      quantity: (json['quantity'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      qrCode: json['qr_code'] as String?,
      image: json['image'] as String?,
      remarks: json['remarks'],
      code: json['code'] as String?,
      imageUrl: json['image_url'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'item_description': instance.itemDescription,
      'quantity': instance.quantity,
      'unit_id': instance.unitId,
      'qr_code': instance.qrCode,
      'image': instance.image,
      'remarks': instance.remarks,
      'code': instance.code,
      'image_url': instance.imageUrl,
      'pivot': instance.pivot,
    };

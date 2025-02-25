// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      id: (json['id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };

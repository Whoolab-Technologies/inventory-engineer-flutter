// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineers_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineersStock _$EngineersStockFromJson(Map<String, dynamic> json) =>
    EngineersStock(
      id: (json['id'] as num?)?.toInt(),
      engineerId: (json['engineer_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      engineer: json['engineer'] == null
          ? null
          : Engineer.fromJson(json['engineer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EngineersStockToJson(EngineersStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'engineer_id': instance.engineerId,
      'store_id': instance.storeId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'engineer': instance.engineer,
    };

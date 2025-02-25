// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String?,
      description: json['description'] as String?,
      unitId: (json['unit_id'] as num?)?.toInt(),
      qrCode: json['qr_code'] as String?,
      image: json['image'],
      remarks: json['remarks'],
      totalStock: (json['total_stock'] as num?)?.toInt(),
      engineerStock: (json['engineer_stock'] as num?)?.toInt(),
      code: json['code'] as String?,
      symbol: json['symbol'] as String?,
      imageUrl: json['image_url'] as String?,
      engineersStock: (json['engineers_stock'] as List<dynamic>?)
          ?.map((e) => EngineersStock.fromJson(e as Map<String, dynamic>))
          .toList(),
      stocks: (json['stocks'] as List<dynamic>?)
          ?.map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
      myStock: (json['my_stock'] as num?)?.toInt(),
      stockWithOthers: (json['stock_with_others'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'description': instance.description,
      'unit_id': instance.unitId,
      'qr_code': instance.qrCode,
      'image': instance.image,
      'remarks': instance.remarks,
      'total_stock': instance.totalStock,
      'engineer_stock': instance.engineerStock,
      'code': instance.code,
      'symbol': instance.symbol,
      'image_url': instance.imageUrl,
      'engineers_stock': instance.engineersStock,
      'stocks': instance.stocks,
      'my_stock': instance.myStock,
      'stock_with_others': instance.stockWithOthers,
    };

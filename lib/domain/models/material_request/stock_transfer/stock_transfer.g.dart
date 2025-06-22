// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransfer _$StockTransferFromJson(Map<String, dynamic> json) =>
    StockTransfer(
      id: (json['id'] as num?)?.toInt(),
      fromStoreId: (json['from_store_id'] as num?)?.toInt(),
      toStoreId: (json['to_store_id'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      statusId: (json['status_id'] as num?)?.toInt(),
      remarks: json['remarks'],
    );

Map<String, dynamic> _$StockTransferToJson(StockTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_store_id': instance.fromStoreId,
      'to_store_id': instance.toStoreId,
      'status': instance.status,
      'status_id': instance.statusId,
      'remarks': instance.remarks,
    };

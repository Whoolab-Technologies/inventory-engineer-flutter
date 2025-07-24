// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferFile _$TransferFileFromJson(Map<String, dynamic> json) => TransferFile(
      id: (json['id'] as num?)?.toInt(),
      stockTransferId: (json['stock_transfer_id'] as num?)?.toInt(),
      materialRequestId: (json['material_request_id'] as num?)?.toInt(),
      file: json['file'] as String?,
      fileMimeType: json['file_mime_type'] as String?,
      transactionType: json['transaction_type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TransferFileToJson(TransferFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stock_transfer_id': instance.stockTransferId,
      'material_request_id': instance.materialRequestId,
      'file': instance.file,
      'file_mime_type': instance.fileMimeType,
      'transaction_type': instance.transactionType,
      'url': instance.url,
    };

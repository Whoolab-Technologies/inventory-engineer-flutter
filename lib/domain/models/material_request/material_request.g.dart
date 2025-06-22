// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequest _$MaterialRequestFromJson(Map<String, dynamic> json) =>
    MaterialRequest(
      id: (json['id'] as num?)?.toInt(),
      requestNumber: json['request_number'] as String?,
      description: json['description'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      statusId: (json['statusId'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MaterialRequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      stockTransfer: json['stock_transfer'] == null
          ? null
          : StockTransfer.fromJson(
              json['stock_transfer'] as Map<String, dynamic>),
    )..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$MaterialRequestToJson(MaterialRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_number': instance.requestNumber,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'statusId': instance.statusId,
      'items': instance.items,
      'stock_transfer': instance.stockTransfer,
    };

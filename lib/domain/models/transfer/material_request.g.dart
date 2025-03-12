// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequest _$MaterialRequestFromJson(Map<String, dynamic> json) =>
    MaterialRequest(
      id: (json['id'] as num?)?.toInt(),
      requestNumber: json['request_number'] as String?,
      description: json['description'],
      engineerId: (json['engineer_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MaterialRequestToJson(MaterialRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_number': instance.requestNumber,
      'description': instance.description,
      'engineer_id': instance.engineerId,
      'store_id': instance.storeId,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };

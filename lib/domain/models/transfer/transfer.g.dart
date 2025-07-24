// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transfer _$TransferFromJson(Map<String, dynamic> json) => Transfer(
      id: (json['id'] as num?)?.toInt(),
      fromStoreId: (json['from_store_id'] as num?)?.toInt(),
      toStoreId: (json['to_store_id'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      materialRequest: json['material_request'] == null
          ? null
          : MaterialRequest.fromJson(
              json['material_request'] as Map<String, dynamic>),
      statusId: (json['status_id'] as num?)?.toInt(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => TransferFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      dnNumber: json['dn_number'],
    );

Map<String, dynamic> _$TransferToJson(Transfer instance) => <String, dynamic>{
      'id': instance.id,
      'from_store_id': instance.fromStoreId,
      'to_store_id': instance.toStoreId,
      'status_id': instance.statusId,
      'status': instance.status,
      'remarks': instance.remarks,
      'created_at': instance.createdAt?.toIso8601String(),
      'notes': instance.notes,
      'items': instance.items,
      'files': instance.files,
      'material_request': instance.materialRequest,
      'dn_number': instance.dnNumber,
    };

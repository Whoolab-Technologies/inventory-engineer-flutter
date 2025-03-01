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
      status: json['status'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MaterialRequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'items': instance.items,
    };

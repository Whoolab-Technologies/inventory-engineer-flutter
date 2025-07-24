// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestFile _$MaterialRequestFileFromJson(Map<String, dynamic> json) =>
    MaterialRequestFile(
      id: (json['id'] as num?)?.toInt(),
      materialRequestId: (json['material_request_id'] as num?)?.toInt(),
      file: json['file'] as String?,
      fileMimeType: json['file_mime_type'] as String?,
      transactionType: json['transaction_type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MaterialRequestFileToJson(
        MaterialRequestFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'material_request_id': instance.materialRequestId,
      'file': instance.file,
      'file_mime_type': instance.fileMimeType,
      'transaction_type': instance.transactionType,
      'url': instance.url,
    };

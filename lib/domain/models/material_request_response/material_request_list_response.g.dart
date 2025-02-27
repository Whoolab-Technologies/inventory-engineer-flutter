// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestListResponse _$MaterialRequestListResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialRequestListResponse(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MaterialRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialRequestListResponseToJson(
        MaterialRequestListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

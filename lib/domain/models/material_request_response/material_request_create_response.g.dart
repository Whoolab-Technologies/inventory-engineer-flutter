// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequestCreateResponse _$MaterialRequestCreateResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialRequestCreateResponse(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: json['data'] == null
          ? null
          : MaterialRequest.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialRequestCreateResponseToJson(
        MaterialRequestCreateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

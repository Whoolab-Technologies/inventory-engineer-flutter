// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialReturnResponse _$MaterialReturnResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialReturnResponse(
      status: (json['status'] as num).toInt(),
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MaterialReturn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialReturnResponseToJson(
        MaterialReturnResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

MaterialReturnPostResponse _$MaterialReturnPostResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialReturnPostResponse(
      status: (json['status'] as num).toInt(),
      error: json['error'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MaterialReturn.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialReturnPostResponseToJson(
        MaterialReturnPostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

MaterialReturnProductResponse _$MaterialReturnProductResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialReturnProductResponse(
      status: (json['status'] as num).toInt(),
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialReturnProductResponseToJson(
        MaterialReturnProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

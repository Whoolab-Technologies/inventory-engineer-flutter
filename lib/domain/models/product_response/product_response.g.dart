// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: json['data'],
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

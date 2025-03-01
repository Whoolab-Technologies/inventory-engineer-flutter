// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      status: (json['status'] as num).toInt(),
      error: json['error'] as bool,
      message: json['message'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

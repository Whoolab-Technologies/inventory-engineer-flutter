// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Engineer _$EngineerFromJson(Map<String, dynamic> json) => Engineer(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      storeId: (json['store_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EngineerToJson(Engineer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'store_id': instance.storeId,
    };

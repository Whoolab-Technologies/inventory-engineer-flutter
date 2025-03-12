// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      storeId: (json['store_id'] as num?)?.toInt(),
      createdType: json['created_type'] as String?,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'store_id': instance.storeId,
      'created_type': instance.createdType,
    };

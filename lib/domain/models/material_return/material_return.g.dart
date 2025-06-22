// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialReturn _$MaterialReturnFromJson(Map<String, dynamic> json) =>
    MaterialReturn(
      id: (json['id'] as num?)?.toInt(),
      fromStoreId: (json['from_store_id'] as num?)?.toInt(),
      toStoreId: (json['to_store_id'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      toStore: json['to_store'] == null
          ? null
          : Store.fromJson(json['to_store'] as Map<String, dynamic>),
      fromStore: json['from_store'] == null
          ? null
          : Store.fromJson(json['from_store'] as Map<String, dynamic>),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => MaterialReturnDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      dnNumber: json['dn_number'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MaterialReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusId: (json['status_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialReturnToJson(MaterialReturn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_store_id': instance.fromStoreId,
      'to_store_id': instance.toStoreId,
      'status_id': instance.statusId,
      'status': instance.status,
      'to_store': instance.toStore,
      'from_store': instance.fromStore,
      'details': instance.details,
      'dn_number': instance.dnNumber,
      'items': instance.items,
    };

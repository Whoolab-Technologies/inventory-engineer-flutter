// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialReturnDetail _$MaterialReturnDetailFromJson(
        Map<String, dynamic> json) =>
    MaterialReturnDetail(
      id: (json['id'] as num?)?.toInt(),
      materialReturnId: (json['material_return_id'] as num?)?.toInt(),
      engineerId: (json['engineer_id'] as num?)?.toInt(),
      engineer: json['engineer'] == null
          ? null
          : Engineer.fromJson(json['engineer'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MaterialReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialReturnDetailToJson(
        MaterialReturnDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'material_return_id': instance.materialReturnId,
      'engineer_id': instance.engineerId,
      'engineer': instance.engineer,
      'items': instance.items,
    };

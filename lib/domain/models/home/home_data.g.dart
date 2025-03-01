// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      (json['material_requests'] as List<dynamic>?)
          ?.map((e) => MaterialRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['out_of_stock_products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'user': instance.user,
      'material_requests': instance.materialRequests,
      'out_of_stock_products': instance.outOfStockProducts,
    };

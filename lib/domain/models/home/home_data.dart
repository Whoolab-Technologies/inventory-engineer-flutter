import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_engineer/domain/auth/model/user/user.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  User? user;

  @JsonKey(name: 'material_requests')
  List<MaterialRequest>? materialRequests;

  @JsonKey(name: 'out_of_stock_products')
  List<Product>? outOfStockProducts;

  HomeData(
    this.user,
    this.materialRequests,
    this.outOfStockProducts,
  );
  factory HomeData.fromJson(Map<String, dynamic> json) {
    return _$HomeDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

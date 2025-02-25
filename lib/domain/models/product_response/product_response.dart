import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseResponse {
  List<Product>? data;

  ProductResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

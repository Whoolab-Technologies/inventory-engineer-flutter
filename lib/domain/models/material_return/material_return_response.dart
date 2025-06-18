import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
part 'material_return_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MaterialReturnResponse extends BaseResponse {
  List<MaterialReturn>? data;

  MaterialReturnResponse({
    required super.status,
    required super.error,
    required super.message,
    this.data,
  });

  factory MaterialReturnResponse.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MaterialReturnResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MaterialReturnPostResponse extends BaseResponse {
  MaterialReturn? data;

  MaterialReturnPostResponse({
    required super.status,
    required super.error,
    required super.message,
    this.data,
  });

  factory MaterialReturnPostResponse.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnPostResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MaterialReturnPostResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MaterialReturnProductResponse extends BaseResponse {
  List<Product>? data;

  MaterialReturnProductResponse({
    required super.status,
    required super.error,
    required super.message,
    this.data,
  });

  factory MaterialReturnProductResponse.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnProductResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MaterialReturnProductResponseToJson(this);
}

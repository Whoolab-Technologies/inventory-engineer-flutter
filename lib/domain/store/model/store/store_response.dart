import "package:json_annotation/json_annotation.dart";
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
part 'store_response.g.dart';

@JsonSerializable()
class StoreResponse extends BaseResponse {
  List<Store>? data;

  StoreResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return _$StoreResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);
}

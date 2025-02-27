import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
part 'material_request_list_response.g.dart';

@JsonSerializable()
class MaterialRequestListResponse extends BaseResponse {
  List<MaterialRequest>? data;

  MaterialRequestListResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory MaterialRequestListResponse.fromJson(Map<String, dynamic> json) {
    return _$MaterialRequestListResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MaterialRequestListResponseToJson(this);
}

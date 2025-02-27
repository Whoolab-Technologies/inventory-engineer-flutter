import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
part 'material_request_create_response.g.dart';

@JsonSerializable()
class MaterialRequestCreateResponse extends BaseResponse {
  MaterialRequest? data;

  MaterialRequestCreateResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory MaterialRequestCreateResponse.fromJson(Map<String, dynamic> json) {
    return _$MaterialRequestCreateResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MaterialRequestCreateResponseToJson(this);
}

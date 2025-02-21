import "package:json_annotation/json_annotation.dart";
import "package:mvp_engineer/domain/auth/model/reset_password_response_data/reset_password_response_data.dart";
import "package:mvp_engineer/infrastructure/core/base_response/base_response.dart";

part "reset_password_response.g.dart";

@JsonSerializable()
class ResetPasswordResponse extends BaseResponse {
  ResetPasswordResponseData? data;

  ResetPasswordResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}

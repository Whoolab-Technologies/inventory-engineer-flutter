import "package:json_annotation/json_annotation.dart";
import "package:mvp_engineer/domain/auth/model/user/user.dart";
import "package:mvp_engineer/infrastructure/core/base_response/base_response.dart";

part "user_response.g.dart";

@JsonSerializable()
class UserResponse extends BaseResponse {
  User? data;

  UserResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

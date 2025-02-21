import "package:json_annotation/json_annotation.dart";

part "reset_password_response_data.g.dart";

@JsonSerializable()
class ResetPasswordResponseData {
  String? code;

  ResetPasswordResponseData({this.code});

  factory ResetPasswordResponseData.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDataToJson(this);
}

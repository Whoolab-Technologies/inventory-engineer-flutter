import "package:json_annotation/json_annotation.dart";

part "base_response.g.dart";

@JsonSerializable()
class BaseResponse {
  int status;
  bool error;
  String message;

  BaseResponse(
      {required this.status, required this.error, required this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

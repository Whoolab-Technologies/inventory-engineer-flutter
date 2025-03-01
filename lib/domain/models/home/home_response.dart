import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  HomeData data;

  HomeResponse({
    required super.status,
    required super.error,
    required super.message,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

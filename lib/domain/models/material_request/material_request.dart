import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';

part 'material_request.g.dart';

@JsonSerializable()
class MaterialRequest {
  int? id;
  @JsonKey(name: 'request_number')
  String? requestNumber;
  String? description;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  List<MaterialRequestItem>? items;

  MaterialRequest({
    this.id,
    this.requestNumber,
    this.description,
    this.items,
  });

  factory MaterialRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestToJson(this);
}

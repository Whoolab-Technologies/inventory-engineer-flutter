import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';

part 'material_request.g.dart';

@JsonSerializable()
class MaterialRequest {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final List<MaterialRequestItem> items;

  MaterialRequest({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.items,
  });

  factory MaterialRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestToJson(this);
}

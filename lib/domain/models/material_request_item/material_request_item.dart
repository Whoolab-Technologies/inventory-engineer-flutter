import 'package:json_annotation/json_annotation.dart';
part 'material_request_item.g.dart';

@JsonSerializable()
class MaterialRequestItem {
  final String productId;
  final String productName;
  final int quantity;

  MaterialRequestItem({
    required this.productId,
    required this.productName,
    required this.quantity,
  });

  factory MaterialRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestItemFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestItemToJson(this);
}

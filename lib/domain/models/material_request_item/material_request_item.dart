import 'package:json_annotation/json_annotation.dart';
part 'material_request_item.g.dart';

@JsonSerializable()
class MaterialRequestItem {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'product_image')
  String? productImage;
  int? quantity;

  MaterialRequestItem({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.quantity,
  });

  factory MaterialRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestItemFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestItemToJson(this);
}

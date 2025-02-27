import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
part 'material_request_item.g.dart';

@JsonSerializable()
class MaterialRequestItem {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_ame')
  String? productName;
  int? quantity;

  MaterialRequestItem({
    this.id,
    this.productId,
    this.productName,
    this.quantity,
  });

  factory MaterialRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestItemFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestItemToJson(this);
}

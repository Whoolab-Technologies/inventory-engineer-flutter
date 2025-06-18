import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
part 'material_return_item.g.dart';

@JsonSerializable()
class MaterialReturnItem {
  int? id;
  @JsonKey(name: 'material_return_id')
  int? materialReturnId;
  @JsonKey(name: 'material_return_detail_id')
  int? materialReturnDetailId;
  @JsonKey(name: 'product_id')
  int? productId;

  Product? product;
  int? issued;
  int? received;

  MaterialReturnItem({
    this.id,
    this.materialReturnId,
    this.materialReturnDetailId,
    this.productId,
    this.product,
    this.issued,
    this.received,
  });

  factory MaterialReturnItem.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaterialReturnItemToJson(this);
}

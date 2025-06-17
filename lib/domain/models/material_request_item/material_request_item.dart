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
  String? unit;
  int? quantity;

  @JsonKey(name: 'cat_id')
  String? catId;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'brand_name')
  String? brandName;
  @JsonKey(name: 'product_category')
  String? productCategory;

  MaterialRequestItem({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.unit,
    this.quantity,
    this.catId,
    this.categoryName,
    this.productCategory,
    this.brandName,
  });

  factory MaterialRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestItemFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestItemToJson(this);
}

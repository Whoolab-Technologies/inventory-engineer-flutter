import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'product_image')
  String? productImage;
  String? unit;
  @JsonKey(name: 'requested_quantity')
  int? requestedQuantity;
  @JsonKey(name: 'issued_quantity')
  int? issuedQuantity;
  @JsonKey(name: 'received_quantity')
  int? receivedQuantity;
  @JsonKey(name: 'category_id')
  String? categoryId;
  @JsonKey(name: 'cat_id')
  String? catId;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'brand_name')
  String? brandName;
  @JsonKey(name: 'product_category')
  String? productCategory;

  Item({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.unit,
    this.requestedQuantity,
    this.issuedQuantity,
    this.receivedQuantity,
    this.categoryName,
    this.productCategory,
    this.brandName,
    this.categoryId,
    this.catId,
  });

  @override
  String toString() {
    return 'Item(id: $id, productId: $productId, productName: $productName, productImage: $productImage, unit: $unit, requestedQuantity: $requestedQuantity, issuedQuantity: $issuedQuantity, receivedQuantity: $receivedQuantity)';
  }

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  Item copyWith({
    int? id,
    int? productId,
    String? productName,
    String? productImage,
    String? unit,
    int? requestedQuantity,
    int? issuedQuantity,
    int? receivedQuantity,
  }) {
    return Item(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      unit: unit ?? this.unit,
      requestedQuantity: requestedQuantity ?? this.requestedQuantity,
      issuedQuantity: issuedQuantity ?? this.issuedQuantity,
      receivedQuantity: receivedQuantity ?? this.receivedQuantity,
    );
  }
}

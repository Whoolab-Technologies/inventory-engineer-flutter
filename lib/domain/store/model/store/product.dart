import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? item;
  @JsonKey(name: 'item_description')
  dynamic itemDescription;
  int? quantity;
  @JsonKey(name: 'unit_id')
  int? unitId;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  String? image;
  dynamic remarks;
  String? code;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  Pivot? pivot;

  Product({
    this.id,
    this.item,
    this.itemDescription,
    this.quantity,
    this.unitId,
    this.qrCode,
    this.image,
    this.remarks,
    this.code,
    this.imageUrl,
    this.pivot,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  int get stockCount => pivot?.quantity ?? 0;
  bool get inStock => (pivot?.quantity ?? 0) > 0;
}

import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/engineer_stocks/engineer_stocks.dart';

import '../stock/stock.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? item;
  String? description;
  @JsonKey(name: 'unit_id')
  int? unitId;
  @JsonKey(name: 'qr_code')
  String? qrCode;
  dynamic image;
  dynamic remarks;
  @JsonKey(name: 'total_stock')
  int? totalStock;
  @JsonKey(name: 'engineer_stock')
  int? engineerStock;
  String? code;
  String? symbol;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'engineers_stock')
  List<EngineerStocks>? engineerStocks;
  List<Stock>? stocks;

  // @JsonKey(name: 'engineer_stock')
  // int? myStock;
  @JsonKey(name: 'stock_with_others')
  int? stockWithOthers;

  @JsonKey(name: 'cat_id')
  String? catId;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'brand_name')
  String? brandName;
  @JsonKey(name: 'product_category')
  String? productCategory;

  Product({
    this.id,
    this.item,
    this.description,
    this.unitId,
    this.qrCode,
    this.image,
    this.remarks,
    this.totalStock,
    this.engineerStock,
    this.code,
    this.symbol,
    this.imageUrl,
    this.engineerStocks,
    this.stocks,
    // this.myStock,
    this.stockWithOthers,
    this.categoryName,
    this.productCategory,
    this.brandName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool get isStockIn => (engineerStock ?? 0) > 0;

  @override
  String toString() {
    return 'Product(id: $id, item: $item, description: $description, unitId: $unitId, qrCode: $qrCode, image: $image, remarks: $remarks, totalStock: $totalStock, engineerStock: $engineerStock, code: $code, symbol: $symbol, imageUrl: $imageUrl,  stockWithOthers: $stockWithOthers)';
  }
}

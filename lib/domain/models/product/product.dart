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

  @JsonKey(name: 'my_stock')
  int? myStock;
  @JsonKey(name: 'stock_with_others')
  int? stockWithOthers;

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
    this.myStock,
    this.stockWithOthers,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool get isStockIn => (myStock ?? 0) > 0;
}

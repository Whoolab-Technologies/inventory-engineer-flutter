import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  int? id;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'product_id')
  int? productId;
  int? quantity;

  Stock({this.id, this.storeId, this.productId, this.quantity});

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}

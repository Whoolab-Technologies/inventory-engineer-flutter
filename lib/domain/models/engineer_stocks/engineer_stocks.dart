import 'package:json_annotation/json_annotation.dart';
import '../engineer/engineer.dart';
part 'engineer_stocks.g.dart';

@JsonSerializable()
class EngineerStocks {
  int? id;
  @JsonKey(name: 'engineer_id')
  int? engineerId;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'product_id')
  int? productId;
  int? quantity;
  Engineer? engineer;

  EngineerStocks({
    this.id,
    this.engineerId,
    this.storeId,
    this.productId,
    this.quantity,
    this.engineer,
  });

  factory EngineerStocks.fromJson(Map<String, dynamic> json) {
    return _$EngineerStocksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EngineerStocksToJson(this);
}

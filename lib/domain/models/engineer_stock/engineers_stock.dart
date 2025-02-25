import 'package:json_annotation/json_annotation.dart';
import '../engineer/engineer.dart';
part 'engineers_stock.g.dart';

@JsonSerializable()
class EngineersStock {
  int? id;
  @JsonKey(name: 'engineer_id')
  int? engineerId;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'product_id')
  int? productId;
  int? quantity;
  Engineer? engineer;

  EngineersStock({
    this.id,
    this.engineerId,
    this.storeId,
    this.productId,
    this.quantity,
    this.engineer,
  });

  factory EngineersStock.fromJson(Map<String, dynamic> json) {
    return _$EngineersStockFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EngineersStockToJson(this);
}

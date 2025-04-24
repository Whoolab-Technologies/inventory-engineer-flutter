import 'package:json_annotation/json_annotation.dart';

part 'stock_transfer.g.dart';

@JsonSerializable()
class StockTransfer {
  int? id;
  @JsonKey(name: 'from_store_id')
  int? fromStoreId;
  @JsonKey(name: 'to_store_id')
  int? toStoreId;
  String? status;
  dynamic remarks;

  StockTransfer({
    this.id,
    this.fromStoreId,
    this.toStoreId,
    this.status,
    this.remarks,
  });

  factory StockTransfer.fromJson(Map<String, dynamic> json) {
    return _$StockTransferFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StockTransferToJson(this);
}

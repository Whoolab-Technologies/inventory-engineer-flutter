import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_shared_components/core/models/status/status.dart';

part 'stock_transfer.g.dart';

@JsonSerializable()
class StockTransfer {
  int? id;
  @JsonKey(name: 'from_store_id')
  int? fromStoreId;
  @JsonKey(name: 'to_store_id')
  int? toStoreId;
  Status? status;
  @JsonKey(name: 'status_id')
  int? statusId;
  dynamic remarks;

  StockTransfer({
    this.id,
    this.fromStoreId,
    this.toStoreId,
    this.status,
    this.statusId,
    this.remarks,
  });

  factory StockTransfer.fromJson(Map<String, dynamic> json) {
    return _$StockTransferFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StockTransferToJson(this);
}

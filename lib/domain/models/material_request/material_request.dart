import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/material_request/stock_transfer/stock_transfer.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:intl/intl.dart';
import 'package:mvp_shared_components/core/models/status/status.dart';
part 'material_request.g.dart';

@JsonSerializable()
class MaterialRequest {
  int? id;
  @JsonKey(name: 'request_number')
  String? requestNumber;
  String? description;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  Status? status;
  int? statusId;
  List<MaterialRequestItem>? items;
  @JsonKey(name: 'stock_transfer')
  StockTransfer? stockTransfer;

  MaterialRequest({
    this.id,
    this.requestNumber,
    this.description,
    this.status,
    this.statusId,
    this.items,
    this.stockTransfer,
  });

  factory MaterialRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialRequestToJson(this);
  String get createdDate =>
      DateFormat('yyyy-MM-dd').format(createdAt!.toLocal());
  String get createdTime => DateFormat('hh:mm a').format(createdAt!.toLocal());
  String get createdDateTime =>
      DateFormat('yyyy-MM-dd hh:mm a').format(createdAt!.toLocal());
}

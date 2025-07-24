import 'package:json_annotation/json_annotation.dart';

part 'transfer_file.g.dart';

@JsonSerializable(explicitToJson: true)
class TransferFile {
  int? id;
  @JsonKey(name: 'stock_transfer_id')
  int? stockTransferId;
  @JsonKey(name: 'material_request_id')
  int? materialRequestId;
  String? file;
  @JsonKey(name: 'file_mime_type')
  String? fileMimeType;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  String? url;

  TransferFile({
    this.id,
    this.stockTransferId,
    this.materialRequestId,
    this.file,
    this.fileMimeType,
    this.transactionType,
    this.url,
  });

  factory TransferFile.fromJson(Map<String, dynamic> json) {
    return _$TransferFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransferFileToJson(this);
}

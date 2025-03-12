import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';

part 'transfer_response.g.dart';

@JsonSerializable()
class TransferResponse extends BaseResponse {
  List<Transfer>? data;

  TransferResponse({status, error, message, this.data})
      : super(status: status, error: error, message: message);

  factory TransferResponse.fromJson(Map<String, dynamic> json) {
    return _$TransferResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$TransferResponseToJson(this);
}

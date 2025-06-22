import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_shared_components/core/models/status/status.dart';

part 'material_request.g.dart';

@JsonSerializable()
class MaterialRequest {
  int? id;
  @JsonKey(name: 'request_number')
  String? requestNumber;
  dynamic description;
  @JsonKey(name: 'engineer_id')
  int? engineerId;
  @JsonKey(name: 'store_id')
  int? storeId;

  @JsonKey(name: 'status_id')
  int? statusId;
  Status? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  MaterialRequest({
    this.id,
    this.requestNumber,
    this.description,
    this.engineerId,
    this.storeId,
    this.status,
    this.createdAt,
    this.statusId,
  });

  @override
  String toString() {
    return 'MaterialRequest(id: $id, requestNumber: $requestNumber, description: $description, engineerId: $engineerId, storeId: $storeId, status: $status, createdAt: $createdAt)';
  }

  factory MaterialRequest.fromJson(Map<String, dynamic> json) {
    return _$MaterialRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaterialRequestToJson(this);

  MaterialRequest copyWith({
    int? id,
    String? requestNumber,
    dynamic description,
    int? engineerId,
    int? storeId,
    int? statusId,
    Status? status,
    DateTime? createdAt,
  }) {
    return MaterialRequest(
      id: id ?? this.id,
      requestNumber: requestNumber ?? this.requestNumber,
      description: description ?? this.description,
      engineerId: engineerId ?? this.engineerId,
      storeId: storeId ?? this.storeId,
      status: status ?? this.status,
      statusId: statusId ?? this.statusId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

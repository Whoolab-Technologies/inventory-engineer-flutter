import 'package:json_annotation/json_annotation.dart';

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
  String? status;
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
    String? status,
    DateTime? createdAt,
  }) {
    return MaterialRequest(
      id: id ?? this.id,
      requestNumber: requestNumber ?? this.requestNumber,
      description: description ?? this.description,
      engineerId: engineerId ?? this.engineerId,
      storeId: storeId ?? this.storeId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

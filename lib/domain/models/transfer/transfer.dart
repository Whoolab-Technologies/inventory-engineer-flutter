import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'material_request.dart';
import 'note.dart';

part 'transfer.g.dart';

@JsonSerializable()
class Transfer {
  int? id;
  @JsonKey(name: 'from_store_id')
  int? fromStoreId;
  @JsonKey(name: 'to_store_id')
  int? toStoreId;
  String? status;
  String? remarks;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  List<Note>? notes;
  List<Item>? items;
  @JsonKey(name: 'material_request')
  MaterialRequest? materialRequest;

  Transfer({
    this.id,
    this.fromStoreId,
    this.toStoreId,
    this.status,
    this.remarks,
    this.createdAt,
    this.notes,
    this.items,
    this.materialRequest,
  });

  @override
  String toString() {
    return 'Transfer(id: $id, fromStoreId: $fromStoreId, toStoreId: $toStoreId, status: $status, remarks: $remarks, createdAt: $createdAt, notes: $notes, items: $items, materialRequest: $materialRequest)';
  }

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return _$TransferFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransferToJson(this);

  Transfer copyWith({
    int? id,
    int? fromStoreId,
    int? toStoreId,
    String? status,
    String? remarks,
    DateTime? createdAt,
    List<Note>? notes,
    List<Item>? items,
    MaterialRequest? materialRequest,
  }) {
    return Transfer(
      id: id ?? this.id,
      fromStoreId: fromStoreId ?? this.fromStoreId,
      toStoreId: toStoreId ?? this.toStoreId,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
      createdAt: createdAt ?? this.createdAt,
      notes: notes ?? this.notes,
      items: items ?? this.items,
      materialRequest: materialRequest ?? this.materialRequest,
    );
  }
}

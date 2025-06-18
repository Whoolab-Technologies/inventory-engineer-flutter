import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/store/store.dart';
import 'material_return_detail.dart';

part 'material_return.g.dart';

@JsonSerializable()
class MaterialReturn {
  int? id;
  @JsonKey(name: 'from_store_id')
  int? fromStoreId;
  @JsonKey(name: 'to_store_id')
  int? toStoreId;
  String? status;
  @JsonKey(name: 'to_store')
  Store? toStore;
  @JsonKey(name: 'from_store')
  Store? fromStore;
  List<MaterialReturnDetail>? details;
  @JsonKey(name: 'dn_number')
  dynamic dnNumber;

  MaterialReturn({
    this.id,
    this.fromStoreId,
    this.toStoreId,
    this.status,
    this.toStore,
    this.fromStore,
    this.details,
    this.dnNumber,
  });

  factory MaterialReturn.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaterialReturnToJson(this);
}

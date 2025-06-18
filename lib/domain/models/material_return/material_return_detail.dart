import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/engineer/engineer.dart';

import 'material_return_item.dart';

part 'material_return_detail.g.dart';

@JsonSerializable()
class MaterialReturnDetail {
  int? id;
  @JsonKey(name: 'material_return_id')
  int? materialReturnId;
  @JsonKey(name: 'engineer_id')
  int? engineerId;
  Engineer? engineer;
  @JsonKey(name: 'items')
  List<MaterialReturnItem>? items;

  MaterialReturnDetail({
    this.id,
    this.materialReturnId,
    this.engineerId,
    this.engineer,
    this.items,
  });

  factory MaterialReturnDetail.fromJson(Map<String, dynamic> json) {
    return _$MaterialReturnDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaterialReturnDetailToJson(this);
}

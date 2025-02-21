import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'product_id')
  int? productId;
  int? quantity;

  Pivot({this.storeId, this.productId, this.quantity});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  int? id;
  String? name;
  String? location;
  @JsonKey(name: 'storekeeper_id')
  int? storekeeperId;
  String? type;
  List<Product>? products;

  Store({
    this.id,
    this.name,
    this.location,
    this.storekeeperId,
    this.type,
    this.products,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

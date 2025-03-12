import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  int? id;
  String? name;
  String? location;
  String? type;

  Store({this.id, this.name, this.location, this.type});

  @override
  String toString() {
    return 'Store(id: $id, name: $name, location: $location, type: $type)';
  }

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  Store copyWith({
    int? id,
    String? name,
    String? location,
    String? type,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      type: type ?? this.type,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'engineer.g.dart';

@JsonSerializable()
class Engineer {
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  @JsonKey(name: 'store_id')
  int? storeId;

  Engineer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.storeId,
  });

  factory Engineer.fromJson(Map<String, dynamic> json) {
    return _$EngineerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EngineerToJson(this);
}

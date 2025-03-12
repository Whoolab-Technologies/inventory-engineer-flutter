import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  @JsonKey(name: 'store_id')
  int? storeId;
  @JsonKey(name: 'created_type')
  String? createdType;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.storeId,
    this.createdType,
  });

  @override
  String toString() {
    return 'CreatedBy(id: $id, firstName: $firstName, lastName: $lastName, email: $email, storeId: $storeId, createdType: $createdType)';
  }

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);

  CreatedBy copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    int? storeId,
    String? createdType,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      storeId: storeId ?? this.storeId,
      createdType: createdType ?? this.createdType,
    );
  }
}

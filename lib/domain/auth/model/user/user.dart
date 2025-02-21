import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  String? token;

  User({this.firstName, this.lastName, this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.decode(String data) {
    return User.fromJson(json.decode(data) as Map<String, dynamic>);
  }

  String encode() => json.encode(toJson());

  String get name => "$firstName $lastName".trim();
}

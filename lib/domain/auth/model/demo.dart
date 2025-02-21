import "dart:convert";

class Demo {
  String? name;
  String? email;

  Demo({this.name, this.email});

  factory Demo.fromMap(Map<String, dynamic> data) => Demo(
        name: data["name"] as String?,
        email: data["email"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Demo].
  factory Demo.fromJson(String data) {
    return Demo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Demo] to a JSON string.
  String e() => json.encode(toMap());
}

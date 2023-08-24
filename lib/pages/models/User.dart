import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromMap(jsonData);
}

String userToJson(User data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class User {
  final String uid;

  User({required this.uid});

  factory User.fromMap(Map<String, dynamic> json) => new User(
    uid: json["uid"],
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
  };
}
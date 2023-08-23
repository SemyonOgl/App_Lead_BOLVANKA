import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class ClientClass {
  final String uid;
  ClientClass({required this.uid});
}

class Client {
  String uid;
  String name;
  String password;
  String mail;

  Client({
    required this.uid,
    required this.name,
    required this.password,
    required this.mail,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
      uid: json["uid"],
      name: json["name"],
      password: json["password"],
      mail: json["mail"],
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "name": name,
    "password": password,
    "mail": mail,
  };
}
import 'dart:convert';

Emplouer employeeFromJson(String str) {
  final jsonData = json.decode(str);
  return Emplouer.fromMap(jsonData);
}

String employeeToJson(Emplouer data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Emplouer {
  String uid;
  String name;
  String contract;
  String password;
  String mail;


  Emplouer({
    required this.uid,
    required this.name,
    required this.contract,
    required this.password,
    required this.mail,
  });

  factory Emplouer.fromMap(Map<String, dynamic> json) => new Emplouer(
    uid: json["uid"],
    name: json["name"],
    contract: json["contract"],
    password: json["password"],
    mail: json["mail"],
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "name": name,
    "contract": contract,
    "password": password,
    "mail": mail,
  };
}
import 'dart:convert';

Order orderFromJson(String str) {
  final jsonData = json.decode(str);
  return Order.fromMap(jsonData);
}

String orderToJson(Order data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Order {
  int id;
  String distance;
  String time;
  String prise;

  Order({
    required this.id,
    required this.distance,
    required this.time,
    required this.prise,
  });

  factory Order.fromMap(Map<String, dynamic> json) => new Order(
    id: json["id"],
    distance: json["distance"],
    time: json["time"],
    prise: json["prise"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "distance": distance,
    "time": time,
    "prise": prise
  };
}
import 'dart:async';
import 'dart:io';
import 'package:app/pages/models/Order.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Future<Database> get database async {
    var _database;
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DataBaseE.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE OrderB ("
              "id INTEGER PRIMARY KEY,"
              "distance TEXT,"
              "time TEXT,"
              "prise TEXT,"
              "active BIT"
              ")");
        });
  }

  newOrder(String distance, String time, String prise) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM OrderB");
    Object? id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into OrderB (id, distance, time, prise, active)"
            " VALUES (?,?,?,?,?)",
        [id, distance, time, prise, 1]);
    return raw;
  }

  updateOrder(Order newOrder) async {
    final db = await database;
    var res = await db.update("OrderB", newOrder.toMap(),
        where: "id = ?", whereArgs: [newOrder.id]);
    return res;
  }

  Future<List<Order>> getAllOrders() async {
    final db = await database;
    var res = await db.query("OrderB", where: "active = ?", whereArgs: [0]);
    List<Order> list = res.isNotEmpty ? res.map((c) => Order.fromMap(c)).toList() : [];
    return list;
  }

  getOrder(int id) async {
    final db = await database;
    var res = await db.query("OrderB", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Order.fromMap(res.first) : null;
  }

  Future<Order> getLastOrder() async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM OrderB ORDER BY id DESC LIMIT 1');
    List<Order> list = res.isNotEmpty ? res.map((c) => Order.fromMap(c)).toList() : [];
    return list[0];
  }

  deleteOrder(int id) async {
    final db = await database;
    return db.delete("OrderB", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from OrderB");
  }
}

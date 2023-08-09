import 'dart:async';
import 'dart:io';
import 'package:app/pages/models/Order.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DBProvidertwo {
  DBProvidertwo._();

  static final DBProvidertwo db = DBProvidertwo._();

  Future<Database> get database async {
    var _database;
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "OrderDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE OrderMain ("
              "id INTEGER PRIMARY KEY,"
              "distance TEXT,"
              "time TEXT,"
              "prise TEXT"
              ")");
        });
  }

  newOrder(String distance, String time, String prise) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM OrderMain");
    Object? id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into OrderMain (id, distance, time, prise)"
            " VALUES (?,?,?,?)",
        [id, distance, time, prise]);
    return raw;
  }

  updateOrder(Order newOrder) async {
    final db = await database;
    var res = await db.update("OrderMain", newOrder.toMap(),
        where: "id = ?", whereArgs: [newOrder.id]);
    return res;
  }

  Future<List<Order>> getAllOrders() async {
    final db = await database;
    var res = await db.query("OrderMain");
    List<Order> list =
    res.isNotEmpty ? res.map((c) => Order.fromMap(c)).toList() : [];
    return list;
  }

  getOrder(int id) async {
    final db = await database;
    var res = await db.query("OrderMain", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Order.fromMap(res.first) : null;
  }

  deleteOrder(int id) async {
    final db = await database;
    return db.delete("OrderMain", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from OrderMain");
  }
}

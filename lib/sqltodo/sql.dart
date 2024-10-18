import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class Sql {
  Database? _db;

  Future<Database?> get db async {
    _db ??= await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/sqflite.db";
    return openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute(
          "CREATE TABLE 'todo'('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'title' TEXT NOT NULL,'description' TEXT NOT NULL,'isDone' INTEGER NOT NULL);");
    });
  }

  Future<List<Map<String, dynamic>>> read(String table) async {
    try {
      Database? DB = await _db;
      List<Map<String, dynamic>> response = await DB!.query(table);
      return response;
    } catch (e) {
      debugPrint("Error: $e");
      return [];
    }
  }

  Future<int> create(String table, {required Map<String, dynamic> data}) async {
    try {
      Database? DB = await _db;
      int response = await DB!.insert(table, data);
      return response;
    } catch (e) {
      debugPrint("Error: $e");
      return -1;
    }
  }

  Future<bool> update(String table,
      {required Map<String, dynamic> data, required String condition}) async {
    try {
      Database? DB = await _db;
      bool response =
          await DB!.update(table, data, where: condition) < 0 ? false : true;
      return response;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }

  Future<bool> delete(String table, {required String condition}) async {
    try {
      Database? DB = await _db;
      bool response =
          await DB!.delete(table, where: condition) < 0 ? false : true;
      return response;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }

  Future<void> drop() async {
    try {
      String datapath = await getDatabasesPath();
      String path = "$datapath/sqflite.db";
      await deleteDatabase(path);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}

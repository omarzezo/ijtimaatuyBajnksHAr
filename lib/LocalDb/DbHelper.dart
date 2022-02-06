import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'OrganizationLocalModel.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "ijmeet.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    await db.execute(
        "Create table organizations(id integer primary key, name text, logo text)");
  }

  Future<List> getOrganizations() async {
    Database db = await this.db;
    var result = await db.query("organizations");
    //return result;
    return List.generate(result.length, (i) {
      return OrganizationLocalModel.fromObject(result[i]);
    });
  }

  Future<int> insert(OrganizationLocalModel product) async {
    Database db = await this.db;
    var result = await db.insert("organizations", product.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from organizations where id= $id");
    return result;
  }

  Future<void> update(OrganizationLocalModel product) async {
    Database db = await this.db;
    var result = await db.update("organizations", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
    return result;
  }
}

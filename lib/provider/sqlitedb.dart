import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends ChangeNotifier {
  static const dbName = "myVehicles.db";
  static const dbVersion = 1;
  static const dbTable = "vehicles";
  static const columnNumber = 'vehiclesNumber';
  static const columnName = 'vehiclesName';
  static const columnModel = 'vehiclesModel';
  static const columnMake = 'vehiclesMake';
  static const columnFuelType = 'vehiclesFuelType';
  static const columnTransmission = 'vehiclesTransmission';

  static final DatabaseHelper instance = DatabaseHelper();
  static Database? _database;
  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);

    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    try {
      db.execute('''
      CREATE TABLE  $dbTable (
      $columnNumber VARCHAR(10) PRIMARY KEY,
      $columnName VARCHAR(50),
      $columnModel VARCHAR(20),
      $columnMake VARCHAR(20),
      $columnFuelType VARCHAR(20),
      $columnTransmission VARCHAR(20)
      )
      ''');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  insertRecord(Map<String, dynamic> row) async {
    try {
      Database? db = await instance.database;
      return await db!.insert(dbTable, row);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> queryRecord() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  Future<int> deleteRecord(String id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$columnNumber=?', whereArgs: [id]);
  }
}

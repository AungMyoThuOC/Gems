// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io' as io;
import 'package:gems_records/data/create_acc.dart';
import 'package:gems_records/data/record.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CreateDatabase {
  CreateDatabase._privateConstructor();
  static final CreateDatabase instance = CreateDatabase._privateConstructor();

  static Database? _db;

  static const String ACCOUNT_TABLE = 'Account';
  static const String RECORD_TABLE = 'Record';
  static const String DB_NAME = 'gemsrecord.db';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $ACCOUNT_TABLE (AutoID INTEGER PRIMARY KEY, name TEXT, phonenum INTEGER, password TEXT, image TEXT, checkZero TEXT)",
    );
    await db.execute(
      "CREATE TABLE $RECORD_TABLE(AutoID INTEGER PRIMARY KEY, record_date TEXT, record_type TEXT, record_weight TEXT, record_price INTEGER, record_fromWhom TEXT, record_phoneNum INTEGER, record_remark TEXT, record_image_list TEXT, first_image TEXT, second_image TEXT, checkZero TEXT)",
    );
  }

  // account
  Future<AccMap> createAcc(AccMap createAcc) async {
    // ignore: no_leading_underscores_for_local_identifiers
    Database? _db = await instance.db;
    createAcc.name = await _db?.insert(ACCOUNT_TABLE, createAcc.toMap());
    return createAcc;
  }

  Future<int> editAcc(AccMap acc, int id) async {
    var _id = await db;
    return await _db!.update(
      ACCOUNT_TABLE,
      acc.toMap(),
      where: 'AutoID = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAcc() async {
    Database? db = await instance.db;
    return await db!.query(ACCOUNT_TABLE);
  }

  Future<int> deleteAcc(int id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    var _db = await db;
    return await _db!.delete(
      ACCOUNT_TABLE,
      where: 'AutoID = ?',
      whereArgs: [id],
    );
  }

  // record
  Future<Record> createRecord(Record createRecord) async {
    Database? _db = await instance.db;
    createRecord.record_phoneNum = await _db?.insert(
      RECORD_TABLE, 
      createRecord.toMap()
    );
    return createRecord;
  }

  Future<int> editRecord(Record record, int id) async {
    // ignore: no_leading_underscores_for_local_identifiers
    var _db = await db;
    return await _db!.update(
      RECORD_TABLE,
      record.toMap(),
      where: 'AutoID = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getRecords() async {
    Database? db = await instance.db;
    return await db!.query(RECORD_TABLE);
  }

  Future<List<Map<String, dynamic>>> getRecord(int id) async {
    Database? db = await instance.db;
    return await db!.query(
      RECORD_TABLE,
      where: 'AutoID = ?',
      whereArgs: [id],
    );
  }

  deleteRecord(int id) async {
    var _db = await db;
    return await _db!.delete(
      RECORD_TABLE,
      where: 'AutoID = ?',
      whereArgs: [id],
    );
  }

  // remove db
  Future deleteDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    await deleteDatabase(path);
  }
}

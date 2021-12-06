import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();
  static Database? _db;

  Future<Database> get database async => _db ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    // var dbpath = await getDatabasesPath();
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();
    String path = join(applicationDirectory.path, "sarangjembardb.db");

    var exists = await io.File(path).exists();

    if (!exists) {
      // try {
      //   await Directory(dirname(path)).create(recursive: true);
      // } catch (_) {}

      ByteData data =
          await rootBundle.load(join("assets", "sarangjembardb.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(path).writeAsBytes(bytes, flush: true);
      // var db = await openDatabase(path);
      // return db;
    }
    var db = await openDatabase(path);
    return db;
  }

  Future<List<Barang>> getBarang() async {
    Database db = await instance.database;
    var barang = await db.query('barang', orderBy: 'nama');
    List<Barang> barangList =
        barang.isNotEmpty ? barang.map((e) => Barang.fromMap(e)).toList() : [];
    return barangList;
  }

  Future<int> addBarang(Barang barang) async {
    Database db = await instance.database;
    return await db.insert('barang', barang.toMap());
  }

  Future<int> updateBarang(Barang barang) async {
    Database db = await instance.database;
    return await db.update('barang', barang.toMap(), where: 'id = ?', whereArgs: [barang.id]);
  }
}

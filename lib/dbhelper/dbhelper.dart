import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sarangjembar_apps/models/barangtop.dart';
import 'package:sarangjembar_apps/models/hutangtop.dart';
import 'package:sarangjembar_apps/models/laporan.dart';
import 'package:sarangjembar_apps/models/transaksi.dart';
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
    return await db.update('barang', barang.toMap(),
        where: 'id = ?', whereArgs: [barang.id]);
  }

  Future<int> deleteBarang(int idbarang) async {
    Database db = await instance.database;
    return await db.delete('barang', where: 'id = ?', whereArgs: [idbarang]);
  }

  Future<List<Transaksi>> getTransaksiPertanggal() async {
    Database db = await instance.database;
    var transaksi = await db.query('transaksi',
        orderBy: 'tanggaltransaksi', groupBy: 'tanggaltransaksi');
    // print(transaksi);
    List<Transaksi> transaksiList = transaksi.isNotEmpty
        ? transaksi.map((e) => Transaksi.fromMap(e)).toList()
        : [];
    return transaksiList;
  }

  Future<int> addTransaksi(Transaksi transaksi) async {
    Database db = await instance.database;
    return await db.insert('transaksi', transaksi.toMap());
  }

  Future<int> deleteTransakBarang(int idbarang) async {
    Database db = await instance.database;
    return await db
        .delete('transaksi', where: 'idbarang = ?', whereArgs: [idbarang]);
  }

  Future<int> deleteTransakTanggal(String tanggal) async {
    Database db = await instance.database;
    return await db.delete('transaksi',
        where: 'tanggaltransaksi = ?', whereArgs: [tanggal]);
  }

  Future<List<Transaksi>> getTransaksiWhereTanggal(String tanggal) async {
    Database db = await instance.database;
    var transaksi = await db.query('transaksi',
        orderBy: 'tanggaltransaksi',
        where: 'tanggaltransaksi = ?',
        whereArgs: [tanggal]);
    // print(transaksi);
    List<Transaksi> transaksiList = transaksi.isNotEmpty
        ? transaksi.map((e) => Transaksi.fromMap(e)).toList()
        : [];
    return transaksiList;
  }

  Future<List<Transaksi>> getTransaksiWhereTanggalHigh(String tanggal) async {
    Database db = await instance.database;
    var transaksi = await db.query('transaksi',
        orderBy: 'qty', where: 'tanggaltransaksi = ?', whereArgs: [tanggal]);
    List<Transaksi> transaksiList = transaksi.isNotEmpty
        ? transaksi.map((e) => Transaksi.fromMap(e)).toList()
        : [];
    // print(transaksiList);
    return transaksiList;
  }

  Future<List<Laporan>> getLaporan({String? tanggal}) async {
    Database db = await instance.database;
    var laporan = await db.query('v_laporan',
        orderBy: 'tanggaltransaksi',
        where: 'tanggaltransaksi = ?',
        whereArgs: [tanggal]);
    List<Laporan> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => Laporan.fromMap(e)).toList()
        : [];
    return laporanList;
  }

  Future<List<BarangTop>> getBarangTopOne({String? tanggal}) async {
    Database db = await instance.database;
    var laporan = await db.rawQuery("""
    SELECT namabarang, SUM(qty) AS terjual 
    FROM v_laporan 
    WHERE tanggaltransaksi = ?
    GROUP BY namabarang
    ORDER BY qty DESC 
    LIMIT 1;""", [tanggal]);
    // print(laporan);
    List<BarangTop> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => BarangTop.fromMap(e)).toList()
        : [];
    // print(laporanList);
    return laporanList;
  }

  Future<List<HutangTop>> getHutangTopOne({String? tanggal}) async {
    Database db = await instance.database;
    var laporan = await db.rawQuery("""
    SELECT namacustomer, alamatcustomer, SUM(qty * hargabarang) AS hutang 
    FROM v_laporan 
    WHERE tanggaltransaksi = ? AND bon = 1
    GROUP BY namabarang, alamatcustomer
    ORDER BY qty DESC 
    LIMIT 1;""", [tanggal]);
    // print(laporan);
    List<HutangTop> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => HutangTop.fromMap(e)).toList()
        : [];
    return laporanList;
  }

  Future<List<HutangTop>> getHutangTop({String? tanggal}) async {
    Database db = await instance.database;
    var laporan = await db.rawQuery("""
    SELECT namacustomer, alamatcustomer, SUM(qty * hargabarang) AS hutang 
    FROM v_laporan 
    WHERE tanggaltransaksi = ? AND bon = 1
    GROUP BY namacustomer, alamatcustomer
    ORDER BY hutang DESC;""", [tanggal]);
    // print(laporan);
    List<HutangTop> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => HutangTop.fromMap(e)).toList()
        : [];
    return laporanList;
  }

  Future<List<BarangTop>> getBarangTop({String? tanggal}) async {
    Database db = await instance.database;
    var laporan = await db.rawQuery("""
    SELECT namabarang, SUM(qty) AS terjual 
    FROM v_laporan 
    WHERE tanggaltransaksi = ?
    GROUP BY namabarang
    ORDER BY qty DESC;""", [tanggal]);
    // print(laporan);
    List<BarangTop> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => BarangTop.fromMap(e)).toList()
        : [];
    // print(laporanList);
    return laporanList;
  }

  Future<List<HutangTop>> getHutang() async {
    Database db = await instance.database;
    var laporan = await db.rawQuery("""
    SELECT namacustomer, alamatcustomer, SUM(qty * hargabarang) AS hutang 
    FROM v_laporan 
    WHERE bon = 1
    GROUP BY namacustomer, alamatcustomer
    ORDER BY namacustomer;""");
    List<HutangTop> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => HutangTop.fromMap(e)).toList()
        : [];
    return laporanList;
  }

  Future<List<Laporan>> getHutangWhereName(
      {String? nama, String? alamat}) async {
    Database db = await instance.database;
    var laporan = await db.query('v_laporan',
        orderBy: 'tanggaltransaksi',
        where: 'namacustomer = ? AND alamatcustomer = ? AND bon = 1',
        whereArgs: [nama, alamat]);
    List<Laporan> laporanList = laporan.isNotEmpty
        ? laporan.map((e) => Laporan.fromMap(e)).toList()
        : [];
    return laporanList;
  }

  Future<int> updateHutang(String nama, String alamat) async {
    Database db = await instance.database;
    return await db.rawUpdate("""
    UPDATE transaksi
    SET bon = 0
    WHERE namacustomer = ? AND alamatcustomer = ?;
     """, [nama, alamat]);
  }
}

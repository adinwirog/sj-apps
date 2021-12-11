import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/barangtop.dart';
import 'package:sarangjembar_apps/models/hutangtop.dart';
import 'package:sarangjembar_apps/models/laporan.dart';
import 'package:sarangjembar_apps/models/transaksi.dart';

class ProviderLaporan extends ChangeNotifier {
  List<BarangTop> _barangtop = [];
  List<HutangTop> _hutangtop = [];
  List<HutangTop> _hutang = [];
  List<Laporan> _allLaporan = [];
  List<BarangTop> _allbarangtop = [];

  List<Transaksi> _listtransaksi = [];
  int _totaltransaksi = 0;
  int _totalquantitas = 0;
  int _totalkurangan = 0;
  int _totalkeuntungan = 0;

  List<Transaksi> get listtransaksi {
    return _listtransaksi;
  }

  List<HutangTop> get hutangtop {
    // print(_hutangtop);
    return _hutangtop;
  }

  List<HutangTop> get hutang {
    // print(_hutangtop);
    return _hutang;
  }

  List<BarangTop> get barangtop {
    // print(_barangtop);
    return _barangtop;
  }

  List<BarangTop> get allbarangtop {
    // print(_barangtop);
    return _allbarangtop;
  }

  int get totalkurangan {
    return _totalkurangan;
  }

  int get totalkeuntungan {
    return _totalkeuntungan;
  }

  int get totaltransaksi {
    _totaltransaksi = _listtransaksi.length;
    return _totaltransaksi;
  }

  int get totalquantitas {
    return _totalquantitas;
  }

  Future<void> fetchTopBarang(String tanggal) async {
    final topbarang = await DbHelper.instance.getBarangTopOne(tanggal: tanggal);
    _barangtop = topbarang;
    // print(topbarang);
    notifyListeners();
  }

  Future<void> fetchData(String tanggal) async {
    final riwayat =
        await DbHelper.instance.getTransaksiWhereTanggalHigh(tanggal);
    final topbarang = await DbHelper.instance.getBarangTopOne(tanggal: tanggal);
    final tophutang = await DbHelper.instance.getHutangTopOne(tanggal: tanggal);
    final hutang = await DbHelper.instance.getHutangTop(tanggal: tanggal);
    final all = await DbHelper.instance.getLaporan(tanggal: tanggal);
    final allbarangtop = await DbHelper.instance.getBarangTop(tanggal: tanggal);
    _listtransaksi = riwayat;
    _barangtop = topbarang;
    _hutangtop = tophutang;
    _hutang = hutang;
    _allLaporan = all;
    _allbarangtop = allbarangtop;
    // print(topbarang);
    setTotal();
    setTotalHutang();
    setTotalKeuntungan();
    notifyListeners();
  }

  void setTotal() {
    var initTotal = 0;
    for (var i = 0; i < _listtransaksi.length; i++) {
      initTotal += _listtransaksi[i].qty!;
    }
    _totalquantitas = initTotal;
    notifyListeners();
  }

  void setTotalHutang() {
    var init = 0;
    for (var i = 0; i < _hutang.length; i++) {
      init += _hutang[i].hutang!;
    }
    _totalkurangan = init;
    notifyListeners();
  }

  void setTotalKeuntungan() {
    var init = 0;
    for (var i = 0; i < _allLaporan.length; i++) {
      init += (_allLaporan[i].qty! * _allLaporan[i].hargabarang!);
    }
    _totalkeuntungan = init;
    notifyListeners();
  }
}

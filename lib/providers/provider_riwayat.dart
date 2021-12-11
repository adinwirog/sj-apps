import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/transaksi.dart';

class ProviderRiwayat extends ChangeNotifier {
  List<Transaksi> _listtransaksi = [];
  List<Transaksi> _listtransaksiToDisplay = [];

  List<Transaksi> get listtransaksi {
    // print(_listtransaksi);
    return _listtransaksi;
  }

  List<Transaksi> get listtransaksiToDisplay {
    // print(_listtransaksiToDisplay);
    return _listtransaksiToDisplay;
  }

  Future<void> fetchData() async {
    var riwayat = await DbHelper.instance.getTransaksiPertanggal();
    _listtransaksi = riwayat;
    // print(riwayat);
    _listtransaksiToDisplay = _listtransaksi;
    // print(_listtransaksiToDisplay);
    notifyListeners();
  }

  Future deleteTransakTanggal(String tanggal) async {
    await DbHelper.instance.deleteTransakTanggal(tanggal);
    notifyListeners();
  }

  void searchTransaksi(String text) {
    _listtransaksiToDisplay = _listtransaksi.where((transaksi) {
      var namaTransaksi = transaksi.tanggal!.toLowerCase();
      return namaTransaksi.contains(text);
    }).toList();
    notifyListeners();
  }
}
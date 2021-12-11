import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/laporan.dart';
import 'package:sarangjembar_apps/models/transaksi.dart';

class ProviderRiwayatDetail extends ChangeNotifier {
  List<Laporan> _listtransaksi = [];
  List<Laporan> _listtransaksiToDisplay = [];

  List<Laporan> get listtransaksi {
    return _listtransaksi;
  }

  List<Laporan> get listtransaksiToDisplay {
    return _listtransaksiToDisplay;
  }

  Future<void> fetchData(String tanggal) async {
    final riwayat = await DbHelper.instance.getLaporan(tanggal: tanggal);
    _listtransaksi = riwayat;
    _listtransaksiToDisplay = _listtransaksi;
    notifyListeners();
  }
}

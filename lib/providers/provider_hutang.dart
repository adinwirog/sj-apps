import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/hutangtop.dart';
import 'package:sarangjembar_apps/models/laporan.dart';

class ProviderHutang extends ChangeNotifier {
  List<HutangTop> _daftarhutang = [];
  List<HutangTop> _daftarhutangtodisplay = [];

  Future<void> fetchData() async {
    final list = await DbHelper.instance.getHutang();
    _daftarhutang = list;
    _daftarhutangtodisplay = _daftarhutang;
    notifyListeners();
  }

  List<HutangTop> get daftarhutang {
    return _daftarhutangtodisplay;
  }

}
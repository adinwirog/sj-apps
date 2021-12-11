import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/laporan.dart';

class ProviderDetailHutang extends ChangeNotifier {
  List<Laporan> _listHutang = [];
  int _total = 0;

  List<Laporan> get listhutang {
    return _listHutang;
  }

  int get total {
    return _total;
  }

  Future<void> fetchData(String nama, String alamat) async {
    final data = await DbHelper.instance.getHutangWhereName(nama: nama, alamat: alamat);
    _listHutang = data;
    setTotal();
    notifyListeners();
  }

  void setTotal() {
    var initTotal = 0;
    for (var i = 0; i < _listHutang.length; i++) {
      initTotal += (_listHutang[i].hargabarang! * _listHutang[i].qty!);
    }
    _total = initTotal;
    notifyListeners();
  }

  Future lunasi(String nama, String alamat) async {
    await DbHelper.instance.updateHutang(nama, alamat);
    notifyListeners();
  }
}
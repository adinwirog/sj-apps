import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';


class ProviderTambahBarang extends ChangeNotifier {
  int _valUnit = 1;

  int get valUnit {
    return _valUnit;
  }

  void addValUnit() {
    _valUnit++;
    notifyListeners();
  }

  void subtrValUnit() {
    if(_valUnit <= 1) {
      _valUnit = 1;
    } else {
      _valUnit--;
    }
    notifyListeners();
  }

  Future addBarang(Barang barang) async{
    await DbHelper.instance.addBarang(barang);
    _valUnit = 1;
    notifyListeners();
  }
}
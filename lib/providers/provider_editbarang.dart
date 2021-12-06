import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';

class ProviderEditBarang extends ChangeNotifier {
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

  void resetValunit() {
    _valUnit = 1;
    notifyListeners();
  }

  Future editBarang(Barang barang) async {
    await DbHelper.instance.updateBarang(barang);
    notifyListeners();
  }
  }
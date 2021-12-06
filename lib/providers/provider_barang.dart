import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';

class ProviderBarang extends ChangeNotifier {
  List<Barang> _barang = [];
  List<Barang> _barangToDisplay = [];

  // ProviderBarang(){
  //   notifyListeners();
  // }

  Future<void> fetchingData() async {
    final datalist = await DbHelper.instance.getBarang();
    _barang = datalist;
    _barangToDisplay = _barang;
    notifyListeners();
  }

  // Future<List<Barang>> get barang async {
  //   _barang = await DbHelper.instance.getBarang();
  //   _barangToDisplay = _barang;
  //   notifyListeners();
  //   return _barang;
  // }

  List<Barang> get barang {
    return _barang;
  }

  void searchBarang(String text) {
    _barangToDisplay = _barang.where((barang) {
      var namaBarang = barang.nama!.toLowerCase();
      return namaBarang.contains(text);
    }).toList();
    notifyListeners();
  }

  List<Barang> get barangdisplay {
    return _barangToDisplay;
  }
}

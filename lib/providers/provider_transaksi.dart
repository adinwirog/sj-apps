import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/dbhelper/dbhelper.dart';
import 'package:sarangjembar_apps/models/transaksi.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:collection/collection.dart';

class ProviderTransaksi extends ChangeNotifier {
  bool _hutang = false;
  List<Barang> _listbarang = [];
  List<int> _qty = [];
  int _total = 0;

  bool get hutang {
    return _hutang;
  }

  List<int> get qty {
    return _qty;
  }

  List<Barang> get listbarang {
    return _listbarang;
  }

  int get total {
    return _total;
  }

  void removeAllitem() {
    _listbarang.clear();
    _qty.clear();
    notifyListeners();
  }

  void setTotal() {
    var initTotal = 0;
    for (var i = 0; i < _listbarang.length; i++) {
      initTotal += (_listbarang[i].hargaPerUnit! * _qty[i]);
    }
    _total = initTotal;
    notifyListeners();
  }

  void setHutang() {
    _hutang = !_hutang;
    notifyListeners();
  }

  void addQty(int index) {
    if (_qty[index] < _listbarang[index].jumlahUnit) {
      _qty[index]++;
      setTotal();
    }
    notifyListeners();
  }

  void substrQty(int index) {
    if (_qty[index] <= 1) {
      deleteBarang(index);
    } else {
      _qty[index]--;
    }
    setTotal();
    notifyListeners();
  }

  void addBarang(Barang barang) {
    var check =
        _listbarang.firstWhereOrNull((element) => element.id == barang.id);
    if (check != null) {
      var indexing =
          _listbarang.indexWhere((element) => element.id == barang.id);
      addQty(indexing);
    } else {
      _listbarang.add(barang);
      _qty.add(1);
    }
    setTotal();
    notifyListeners();
  }

  void deleteBarang(int index) {
    _qty.removeAt(index);
    _listbarang.removeAt(index);
    setTotal();
    notifyListeners();
  }

  Future addTransaksi(dynamic now) async {
    for (var i = 0; i < _listbarang.length; i++) {
      await DbHelper.instance.addTransaksi(Transaksi(null, now, now, now,
          (hutang == false) ? 0 : 1, _qty[i], _listbarang[i].id));
      await DbHelper.instance.updateBarang(Barang(
          _listbarang[i].id,
          _listbarang[i].nama,
          _listbarang[i].hargaPerUnit,
          (_listbarang[i].jumlahUnit - _qty[i])));
    }
    notifyListeners();
  }

  Future addHutang(dynamic now, String nama, String alamat) async {
    for (var i = 0; i < _listbarang.length; i++) {
      await DbHelper.instance.addTransaksi(Transaksi(null, nama, alamat, now,
          (hutang == false) ? 0 : 1, _qty[i], _listbarang[i].id));
      await DbHelper.instance.updateBarang(Barang(
          _listbarang[i].id,
          _listbarang[i].nama,
          _listbarang[i].hargaPerUnit,
          (_listbarang[i].jumlahUnit - _qty[i])));
    }
    notifyListeners();
  }
}

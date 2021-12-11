import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/detail_barang.dart';
import 'package:sarangjembar_apps/screens/detail_hutang.dart';
import 'package:sarangjembar_apps/screens/detail_riwayat.dart';
import 'package:sarangjembar_apps/screens/main_screen.dart';
import 'package:sarangjembar_apps/screens/pilih_unit.dart';
import 'package:sarangjembar_apps/screens/tambah_barang.dart';
import 'package:sarangjembar_apps/screens/top_hutang.dart';
import 'package:sarangjembar_apps/screens/top_penjualan.dart';

const String MainScreenPage = '/';
const String DetailBarangPage = 'detailbarangpage';
const String TambahBarangPage = 'tambahbarangpage';
const String PilihUnitBarangPage = 'pilihunitbarangpage';
const String DetailRiwayatPage = 'detailriwayatpage';
const String TopPenjualanPage = 'toppenjualanpage';
const String TopHutangPage = 'tophutangpage';
const String DetailHutangPage = 'detailhutangpage';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case MainScreenPage:
      return MaterialPageRoute(builder: (context) => MainScreen());
    case DetailBarangPage:
      return MaterialPageRoute(
          builder: (context) => DetailBarangScreen(barang: args));
    case TambahBarangPage:
      return MaterialPageRoute(builder: (context) => TambahDataScreen());
    case PilihUnitBarangPage:
      return MaterialPageRoute(builder: (context) => PilihUnitBarangScreen());
    case DetailRiwayatPage:
      return MaterialPageRoute(
          builder: (context) => DetailRiwayatScreen(tanggal: args));
    case TopPenjualanPage:
      return MaterialPageRoute(builder: (context) => TopPenjualanScreen());
    case TopHutangPage:
      return MaterialPageRoute(builder: (context) => TopHutangScreen());
    case DetailHutangPage:
      return MaterialPageRoute(
          builder: (context) => DetailHutangScreen(
                nama: (args as Map)['nama'].toString(),
                alamat: (args)['alamat'].toString(),
              ));
    default:
      throw ("Route Not Available");
  }
}

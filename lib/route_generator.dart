import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/detail_barang.dart';
import 'package:sarangjembar_apps/screens/main_screen.dart';
import 'package:sarangjembar_apps/screens/tambah_barang.dart';

const String MainScreenPage = '/';
const String DetailBarangPage = 'detailbarangpage';
const String TambahBarangPage = 'tambahbarangpage';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case MainScreenPage:
      return MaterialPageRoute(builder: (context) => MainScreen());
    case DetailBarangPage:
      return MaterialPageRoute(builder: (context) => DetailBarangScreen(barang: args));
    case TambahBarangPage:
      return MaterialPageRoute(builder: (context) => TambahDataScreen());
    default:
      throw ("Route Not Available");
  }
}

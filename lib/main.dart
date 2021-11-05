import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/detail_barang.dart';
import 'package:sarangjembar_apps/screens/main_screen.dart';

void main() {
  runApp(const CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

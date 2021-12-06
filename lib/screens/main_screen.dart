import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/tabbar/penjualan/penjualan_tab.dart';
import 'package:sarangjembar_apps/screens/tabbar/stokbarang/stokbarang_tab.dart';

import 'tabbar/hutang/hutang_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentindex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    StokBarangTab(),
    PenjualanTab(),
    HutangTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: 'STOK BARANG',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'PENJUALAN'),
            BottomNavigationBarItem(
                icon: Icon(Icons.money), label: 'BON/HUTANG')
          ],
          currentIndex: _currentindex,
          unselectedIconTheme: IconThemeData(color: Color(0xff000000)),
          selectedItemColor: Color(0xffA9C500),
          onTap: (int index) {
            setState(() {
              _currentindex = index;
            });
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/tabbar/penjualan/views/laporan.dart';
import 'package:sarangjembar_apps/screens/tabbar/penjualan/views/riwayat.dart';
import 'package:sarangjembar_apps/screens/tabbar/penjualan/views/transaksi.dart';

class PenjualanTab extends StatefulWidget {
  const PenjualanTab({Key? key}) : super(key: key);

  @override
  _PenjualanTabState createState() => _PenjualanTabState();
}

class _PenjualanTabState extends State<PenjualanTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7165FF),
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text("Transaksi")),
              Tab(child: Text("Riwayat")),
              Tab(child: Text("Laporan")),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TransaksiView(),
            RiwayatView(),
            LaporanView(),
          ],
        ),
      ),
    );
  }
}

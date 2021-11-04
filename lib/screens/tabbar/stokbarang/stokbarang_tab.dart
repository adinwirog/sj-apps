import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/tabbar/stokbarang/views/daftar_barang.dart';
import 'package:sarangjembar_apps/screens/tabbar/stokbarang/views/tambah_data.dart';

class StokBarangTab extends StatefulWidget {
  const StokBarangTab({Key? key}) : super(key: key);

  @override
  _StokBarangTabState createState() => _StokBarangTabState();
}

class _StokBarangTabState extends State<StokBarangTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7165FF),
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text("Daftar Barang")),
              Tab(child: Text("Tambah Data")),
            ],
          ),
//             title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            DaftarBarangView(),
            TambahDataView(),
          ],
        ),
      ),
    );
  }
}

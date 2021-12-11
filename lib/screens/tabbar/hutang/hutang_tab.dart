import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/tabbar/hutang/views/daftar.dart';

class HutangTab extends StatefulWidget {
  const HutangTab({Key? key}) : super(key: key);

  @override
  _HutangTabState createState() => _HutangTabState();
}

class _HutangTabState extends State<HutangTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7165FF),
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text("Daftar Hutang")),
              // Tab(child: Text("Pelunasan")),
            ],
          ),
        ),
        body: TabBarView(children: [
          DaftarViewState(),
          // DaftarViewState(),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LaporanView extends StatefulWidget {
  const LaporanView({Key? key}) : super(key: key);

  @override
  _LaporanViewState createState() => _LaporanViewState();
}

class _LaporanViewState extends State<LaporanView> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDEA),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Bulan Ini",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(123, 26), primary: Color(0xff7165FF)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xfffcfcfc),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Penjualan",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Rp. 12000",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff00930F)),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kurangan",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Rp. 2000",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffEE0000)),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hasil Bersih",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Rp. 8000",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff00930F)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xfffcfcfc),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Top Penjualan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Barang 1",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "50 unit Terjual",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff00930F)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xfffcfcfc),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Top Hutang",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Adin",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Rp. 12000",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xffEE0000)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

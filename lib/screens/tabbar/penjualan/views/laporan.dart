import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_laporan.dart';
import 'package:sarangjembar_apps/route_generator.dart';

class LaporanView extends StatefulWidget {
  const LaporanView({Key? key}) : super(key: key);

  @override
  _LaporanViewState createState() => _LaporanViewState();
}

class _LaporanViewState extends State<LaporanView> {
  DateTime selectdate = DateTime.now();
  late String datestring;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
          future: Provider.of<ProviderLaporan>(context, listen: false)
              .fetchData(DateFormat.yMMMMd().format(selectdate)),
          builder: (context, snapshot) {
            return Consumer<ProviderLaporan>(builder: (context, data, _) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: selectdate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050))
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              selectdate = value;
                            });
                          }
                        });
                      },
                      child: Text(
                        "${DateFormat.yMMMMd().format(selectdate)}",
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
                                "Total Transaksi",
                                style: TextStyle(fontSize: 20),
                              ),
                              Consumer<ProviderLaporan>(
                                builder: (context, data, _) {
                                  return Text(
                                    "${data.totaltransaksi} transaksi",
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff00930F)),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 28),
                          Consumer<ProviderLaporan>(
                            builder: (context, data, _) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Quantitas Terjual",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "${data.totalquantitas} Unit",
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff00930F)),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Penjualan",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Rp. ${data.totalkeuntungan}",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff00930F)),
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
                                "Rp. ${data.totalkurangan}",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffEE0000)),
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
                                "Rp. ${data.totalkeuntungan - data.totalkurangan}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: (data.totalkeuntungan -
                                              data.totalkurangan <
                                          1)
                                      ? Color(0xffEE0000)
                                      : Color(0xff00930F),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TopPenjualanPage);
                    },
                    child: Container(
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
                            Consumer<ProviderLaporan>(
                              builder: (context, data, _) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${(data.barangtop.length == 0) ? "Tidak ada data" : data.barangtop[0].namabarang}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "${(data.barangtop.length == 0) ? 0 : data.barangtop[0].terjual} unit Terjual",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff00930F)),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TopHutangPage);
                    },
                    child: Container(
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
                            Consumer<ProviderLaporan>(
                              builder: (context, data, _) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${(data.hutangtop.isEmpty) ? "Tidak ada data" : data.hutangtop[0].namacustomer}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Rp. ${(data.hutangtop.isEmpty) ? 0 : data.hutangtop[0].hutang}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffEE0000)),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
          }),
    );
  }
}

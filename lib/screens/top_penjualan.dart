import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_laporan.dart';

class TopPenjualanScreen extends StatefulWidget {
  const TopPenjualanScreen({Key? key}) : super(key: key);

  @override
  _TopPenjualanScreenState createState() => _TopPenjualanScreenState();
}

class _TopPenjualanScreenState extends State<TopPenjualanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Penjualan"),
        backgroundColor: Color(0xff7165FF),
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Consumer<ProviderLaporan>(
              builder: (context, data, _) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.allbarangtop.length + 1,
                    itemBuilder: (context, index) {
                      if (index == data.allbarangtop.length) {
                        return SizedBox(height: 50);
                      }
                      return Card(
                        child: ListTile(
                          title: Text(
                            "${data.allbarangtop[index].namabarang}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff000000),
                            ),
                          ),
                          trailing: Text(
                            "${data.allbarangtop[index].terjual} Unit Terjual",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff00930F),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

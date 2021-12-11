import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_laporan.dart';

class TopHutangScreen extends StatefulWidget {
  const TopHutangScreen({Key? key}) : super(key: key);

  @override
  _TopHutangScreenState createState() => _TopHutangScreenState();
}

class _TopHutangScreenState extends State<TopHutangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Hutang"),
        backgroundColor: Color(0xff7165FF),
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Consumer<ProviderLaporan>(builder: (context, data, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: data.hutang.length + 1,
                  itemBuilder: (context, index) {
                    if (index == data.hutang.length) {
                      return SizedBox(height: 50);
                    }
                    return Card(
                      child: ListTile(
                        title: Text(
                          "${data.hutang[index].namacustomer}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff000000),
                          ),
                        ),
                        subtitle: Text(
                          "${data.hutang[index].alamatcustomer}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff000000),
                          ),
                        ),
                        trailing: Text(
                          "Rp. ${data.hutang[index].hutang}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffEE0000),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

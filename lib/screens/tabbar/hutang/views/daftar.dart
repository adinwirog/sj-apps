import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_hutang.dart';
import 'package:sarangjembar_apps/route_generator.dart';

class DaftarViewState extends StatefulWidget {
  const DaftarViewState({Key? key}) : super(key: key);

  @override
  _DaftarViewStateState createState() => _DaftarViewStateState();
}

class _DaftarViewStateState extends State<DaftarViewState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
          future:
              Provider.of<ProviderHutang>(context, listen: false).fetchData(),
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Cari Nama/Alamat ...",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  Consumer<ProviderHutang>(builder: (context, data, _) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.daftarhutang.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            onTap: () async {
                              var value = await Navigator.pushNamed(
                                context,
                                DetailHutangPage,
                                arguments: {
                                  'nama': data.daftarhutang[index].namacustomer,
                                  'alamat':
                                      data.daftarhutang[index].alamatcustomer,
                                },
                              );
                              if (value == true) {
                                setState(() {});
                              }
                            },
                            title: Text(
                              "${data.daftarhutang[index].namacustomer}",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              "${data.daftarhutang[index].alamatcustomer}",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff676767)),
                            ),
                            trailing: Text(
                              "Rp. ${data.daftarhutang[index].hutang}",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xffEE0000)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
    );
  }
}

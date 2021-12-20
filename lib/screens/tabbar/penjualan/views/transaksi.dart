import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_transaksi.dart';
import 'package:sarangjembar_apps/route_generator.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  _TransaksiViewState createState() => _TransaksiViewState();
}

class _TransaksiViewState extends State<TransaksiView> {
  String now = DateFormat.yMMMMd().format(DateTime.now());
  late final namaCustomer;
  late final alamat;

  @override
  void initState() {
    namaCustomer = TextEditingController();
    alamat = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    namaCustomer.dispose();
    alamat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderTransaksi>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Nama",
                    //   style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    // ),
                    SizedBox(
                      height: 26,
                      child: Consumer<ProviderTransaksi>(
                          builder: (context, data, _) {
                        return Visibility(
                          visible: true,
                          child: TextField(
                            controller: namaCustomer,
                            enabled: (data.hutang == true) ? true : false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Nama",
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 26,
                      child: Consumer<ProviderTransaksi>(
                          builder: (context, data, _) {
                        return Visibility(
                          visible: true,
                          child: TextField(
                            controller: alamat,
                            enabled: (data.hutang == true) ? true : false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Alamat",
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Consumer<ProviderTransaksi>(
                            builder: (context, data, _) {
                          return Visibility(
                            visible: true,
                            child: Switch.adaptive(
                                value: data.hutang,
                                onChanged: (value) {
                                  data.setHutang();
                                }),
                          );
                        }),
                        SizedBox(
                          width: 32,
                        ),
                        Visibility(
                          visible: true,
                          child: Text(
                            "Melakukan Bon ?",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff676767)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Consumer<ProviderTransaksi>(builder: (context, data, _) {
              return ListView.builder(
                itemCount: data.listbarang.length + 1,
                itemBuilder: (context, index) {
                  if (index == data.listbarang.length) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 3),
                      child: ElevatedButton(
                        onPressed: () async {
                          dynamic item = await Navigator.pushNamed(
                              context, PilihUnitBarangPage);
                          if (item != null) {
                            data.addBarang(item);
                          }
                        },
                        child: Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff7165FF),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Text("${data.listbarang[index].nama}",
                            style: TextStyle(fontSize: 17)),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                data.substrQty(index);
                              },
                              child: Icon(Icons.remove, size: 13),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(15, 25),
                                  primary: Color(0xff7165FF)),
                            ),
                            Text(
                              data.qty[index].toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                data.addQty(index);
                              },
                              child: Icon(Icons.add, size: 13),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(15, 25),
                                  primary: Color(0xff7165FF)),
                            ),
                          ],
                        ),
                        subtitle: Center(
                          child: Text(
                            "Rp. ${data.listbarang[index].hargaPerUnit} /unit",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              data.deleteBarang(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.black)),
                      ),
                    ),
                  );
                },
                // children: [
                //   Padding(
                //     padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                //     child: ElevatedButton(
                //       onPressed: () {},
                //       child: Icon(Icons.add),
                //       style: ElevatedButton.styleFrom(
                //         primary: Color(0xff7165FF),
                //       ),
                //     ),
                //   )
                // ],
              );
            })),
            ElevatedButton(
              onPressed: () {
                if (prov.hutang == true) {
                  if (namaCustomer.text.toString() == "" ||
                      alamat.text.toString() == "" ||
                      prov.listbarang.isEmpty) {
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Melakukan Hutang"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Nama:  ${namaCustomer.text}"),
                              Text("Alamat:  ${alamat.text}"),
                              Text("Total Hutang:  ${prov.total}"),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text("Tidak"),
                            ),
                            TextButton(
                              onPressed: () async {
                                await prov.addHutang(
                                    now,
                                    namaCustomer.text.toString(),
                                    alamat.text.toString());
                                namaCustomer.clear();
                                alamat.clear();
                                prov.removeAllitem();
                                Navigator.of(context).pop(true);
                              },
                              child: Text("Ya"),
                            )
                          ],
                        );
                      },
                    ).then((value) {
                      if (value != false) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Melakukan Hutang"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Data Berhasil disimpan"),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Ok"),
                                )
                              ],
                            );
                          },
                        );
                      }
                    });
                  }
                } else if (prov.listbarang.isNotEmpty) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      var _bayar = TextEditingController();
                      return AlertDialog(
                        title: Text("Bayar"),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          controller: _bayar,
                          decoration: InputDecoration(
                              hintText: "Masukkan Nominal bayar"),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () async {
                                if (int.parse(_bayar.text) < prov.total) {
                                } else {
                                  await prov.addTransaksi(now);
                                  prov.removeAllitem();
                                  Navigator.of(context).pop(_bayar.text);
                                }
                              },
                              child: Text("Bayar"))
                        ],
                      );
                    },
                  ).then((value) {
                    if (value != false) {
                      return showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Bayar"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Total:  ${prov.total}"),
                                Text("Uang Dibayar:  ${value}"),
                                Text(
                                    "Selisih:  ${int.parse(value) - prov.total}"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  prov.setTotal();
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ok"),
                              )
                            ],
                          );
                        },
                      );
                    }
                  });
                }
              },
              child: Text("Bayar"),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff7165FF),
              ),
            ),
            Container(
              // width: 387,
              // height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xff7165FF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total :",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Consumer<ProviderTransaksi>(
                          builder: (context, data, _) {
                            return Text(
                              "Rp. ${data.total}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Bayar :",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //     Text(
                    //       "Rp. 3000",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Selisih :",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //     Text(
                    //       "Rp. 3000",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

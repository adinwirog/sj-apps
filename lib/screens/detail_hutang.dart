import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_detailhutang.dart';

class DetailHutangScreen extends StatefulWidget {
  final nama;
  final alamat;
  const DetailHutangScreen({Key? key, this.nama, this.alamat})
      : super(key: key);

  @override
  _DetailHutangScreenState createState() => _DetailHutangScreenState();
}

class _DetailHutangScreenState extends State<DetailHutangScreen> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderDetailHutang>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Riwayat"),
        backgroundColor: Color(0xff7165FF),
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
          future: Provider.of<ProviderDetailHutang>(context, listen: false)
              .fetchData(widget.nama, widget.alamat),
          builder: (context, snapshot) {
            return Padding(
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
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.nama} ",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "${widget.alamat} ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.green),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     hintText: "Cari Barang...",
                  //     suffixIcon: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(Icons.clear),
                  //     ),
                  //   ),
                  //   keyboardType: TextInputType.text,
                  //   onChanged: (text) {
                  //     //   text = text.toLowerCase();
                  //     //   setState(() {
                  //     //     _barangToDisplay = _barang.where((barang) {
                  //     //       var namaBarang = barang.nama.toLowerCase();
                  //     //       return namaBarang.contains(text);
                  //     //     }).toList();
                  //     //   });
                  //     data.searchBarang(text);
                  //   },
                  // ),
                  SizedBox(height: 20),
                  Consumer<ProviderDetailHutang>(builder: (context, data, _) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.listhutang.length + 1,
                        itemBuilder: (context, index) {
                          if (index == data.listhutang.length) {
                            return SizedBox(height: 50);
                          }
                          return Card(
                            child: ListTile(
                              leading: SizedBox(
                                width: 65,
                                child: Text(
                                  "${data.listhutang[index].tanggal}",
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              title: Center(
                                child: Text(
                                  "Qty dibeli [${data.listhutang[index].qty}]  ",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              subtitle: Center(
                                child: Text(
                                  "${data.listhutang[index].namabarang} <=> Rp. ${data.listhutang[index].hargabarang}",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              trailing: Text(
                                "Rp. ${data.listhutang[index].qty! * data.listhutang[index].hargabarang!}",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffF23F3F)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color(0xffE9E9E9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    var _bayar = TextEditingController();
                    return AlertDialog(
                      title: Text("Lunasi"),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        controller: _bayar,
                        decoration:
                            InputDecoration(hintText: "Masukkan Nominal bayar"),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              if (_bayar.text.isNotEmpty) {
                                if (int.parse(_bayar.text) >= prov.total) {
                                  Navigator.of(context).pop(_bayar.text);
                                }
                              }
                            },
                            child: Text("Bayar"))
                      ],
                    );
                  },
                ).then(
                  (value) {
                    if (value != false) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Konfimasi Lunasi"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Nama => ${widget.nama}"),
                                Text("Alamat => ${widget.alamat}"),
                                Text("Total Hutang => Rp. ${prov.total}"),
                                Text("Bayar => Rp. $value"),
                                Text("====================="),
                                Text(
                                    "Kembalian => Rp. ${int.parse(value) - prov.total} "),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Cancel")),
                              TextButton(
                                  onPressed: () async {
                                    await prov.lunasi(
                                        widget.nama, widget.alamat);
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text("Lunasi"))
                            ],
                          );
                        },
                      ).then((value) {
                        if (value != false) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Lunasi"),
                                content: Text("Data berhasil disimpan"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            },
                          ).then((value) => Navigator.of(context).pop(true));
                        }
                      });
                    }
                  },
                );
              },
              child: Text(
                "Lunasi",
                style: TextStyle(fontSize: 16),
              ),
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
                        Consumer<ProviderDetailHutang>(
                            builder: (context, data, _) {
                          return Text(
                            "Rp. ${data.total}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          );
                        }),
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

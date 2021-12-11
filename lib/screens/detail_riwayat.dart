import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_detailriwayat.dart';
import 'package:sarangjembar_apps/providers/provider_riwayat.dart';

class DetailRiwayatScreen extends StatefulWidget {
  final tanggal;
  const DetailRiwayatScreen({Key? key, this.tanggal}) : super(key: key);

  @override
  _DetailRiwayatScreenState createState() => _DetailRiwayatScreenState();
}

class _DetailRiwayatScreenState extends State<DetailRiwayatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Riwayat"),
        backgroundColor: Color(0xff7165FF),
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
        future: Provider.of<ProviderRiwayatDetail>(context, listen: false)
            .fetchData(widget.tanggal),
        builder: (context, snapshot) {
          return Consumer<ProviderRiwayatDetail>(
            builder: (context, data, _) {
              return Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.listtransaksiToDisplay.length + 1,
                        itemBuilder: (context, index) {
                          if (index == data.listtransaksiToDisplay.length) {
                            return SizedBox(height: 50);
                          }
                          return Card(
                            child: ListTile(
                              onTap: () {},
                              leading: SizedBox(
                                width: 65,
                                child: Text(
                                  data.listtransaksiToDisplay[index]
                                      .namaCustomer
                                      .toString(),
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              title: Center(
                                child: Text(
                                  "Qty dibeli [ ${data.listtransaksiToDisplay[index].qty.toString()} ] ",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              subtitle: Center(
                                child: Text(
                                  "{ ${data.listtransaksiToDisplay[index].namabarang.toString()} || Rp. ${data.listtransaksiToDisplay[index].hargabarang.toString()} }",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff7165FF)),
                                ),
                              ),
                              trailing: Text(
                                "Rp. ${data.listtransaksiToDisplay[index].hargabarang! * data.listtransaksiToDisplay[index].qty!}",
                                style: TextStyle(
                                    fontSize: 20, color: (data.listtransaksiToDisplay[index].bon == 0) ? Color(0xff00930F) : Color(0xffF23F3F)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

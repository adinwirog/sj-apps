import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_riwayat.dart';
import 'package:sarangjembar_apps/route_generator.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({Key? key}) : super(key: key);

  @override
  _RiwayatViewState createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
        future:
            Provider.of<ProviderRiwayat>(context, listen: false).fetchData(),
        builder: (context, snapshot) {
          return Consumer<ProviderRiwayat>(
            builder: (context, data, _) {
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
                        hintText: "Cari Bulan/Tahun ...",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.clear),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      onChanged: (text) {
                        //   text = text.toLowerCase();
                        //   setState(() {
                        //     _barangToDisplay = _barang.where((barang) {
                        //       var namaBarang = barang.nama.toLowerCase();
                        //       return namaBarang.contains(text);
                        //     }).toList();
                        //   });
                        data.searchTransaksi(text);
                      },
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.listtransaksiToDisplay.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailRiwayatPage,
                                arguments: data
                                    .listtransaksiToDisplay[index].tanggal
                                    .toString(),
                              );
                            },
                            title: Text(
                              "${data.listtransaksiToDisplay[index].tanggal}",
                              style: TextStyle(fontSize: 20),
                            ),
                            trailing: Wrap(
                              runSpacing: 20.0,
                              alignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Hapus Data Riwayat"),
                                        content: Text(
                                            "Anda yakin ingin menghapus riwayat ini?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: Text("Tidak")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                              },
                                              child: Text("Ya")),
                                        ],
                                      ),
                                    ).then(
                                      (value) async {
                                        if (value == true) {
                                          await data.deleteTransakTanggal(data
                                              .listtransaksiToDisplay[index]
                                              .tanggal
                                              .toString());
                                          setState(() {});
                                        }
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
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

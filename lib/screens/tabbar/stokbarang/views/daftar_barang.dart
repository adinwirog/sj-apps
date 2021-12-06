import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:sarangjembar_apps/providers/provider_barang.dart';
import 'package:sarangjembar_apps/route_generator.dart';

class DaftarBarangView extends StatefulWidget {
  const DaftarBarangView({Key? key}) : super(key: key);

  @override
  _DaftarBarangViewState createState() => _DaftarBarangViewState();
}

class _DaftarBarangViewState extends State<DaftarBarangView> {
  // List<Barang> _barang = [
  //   Barang(nama: "Mizone", hargaPerUnit: 1000, jumlahUnit: 20),
  //   Barang(nama: "Yuzu", hargaPerUnit: 1000, jumlahUnit: 20),
  //   Barang(nama: "Milkuat", hargaPerUnit: 1000, jumlahUnit: 10),
  //   Barang(nama: "Milkuat Bantal", hargaPerUnit: 2000, jumlahUnit: 20),
  //   Barang(nama: "Ozone", hargaPerUnit: 1000, jumlahUnit: 20),
  // ];

  // List<Barang> _barangToDisplay = [];

  @override
  void initState() {
    // setState(() {
    //   // _barangToDisplay = _barang;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
          future: Provider.of<ProviderBarang>(context, listen: false)
              .fetchingData(),
          builder: (context, snapshot) {
            return Consumer<ProviderBarang>(builder: (context, data, _) {
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
                        hintText: "Cari Barang...",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.clear),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (text) {
                        //   text = text.toLowerCase();
                        //   setState(() {
                        //     _barangToDisplay = _barang.where((barang) {
                        //       var namaBarang = barang.nama.toLowerCase();
                        //       return namaBarang.contains(text);
                        //     }).toList();
                        //   });
                        data.searchBarang(text);
                      },
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.barangdisplay.length + 1,
                        itemBuilder: (context, index) {
                          if (index == data.barangdisplay.length) {
                            return SizedBox(height: 50);
                          }
                          return Card(
                            child: ListTile(
                              onTap: () async {
                                var rebuild = await Navigator.pushNamed(
                                    context, DetailBarangPage,
                                    arguments: data.barangdisplay[index]);
                                if (rebuild == true) {
                                  setState(() {});
                                }
                                // print(data.barangdisplay[index].nama);
                              },
                              title: Text(
                                data.barangdisplay[index].nama.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                "Rp. " +
                                    data.barangdisplay[index].hargaPerUnit
                                        .toString() +
                                    "/unit",
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: Text(
                                data.barangdisplay[index].jumlahUnit
                                        .toString() +
                                    " Unit",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var rebuild = await Navigator.pushNamed(context, TambahBarangPage);
          if (rebuild == true) {
            setState(() {});
          }
        },
        backgroundColor: Color(0xff7165FF),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

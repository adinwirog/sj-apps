import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:sarangjembar_apps/providers/provider_tambahbarang.dart';

class TambahDataScreen extends StatefulWidget {
  const TambahDataScreen({Key? key}) : super(key: key);

  @override
  _TambahDataScreenState createState() => _TambahDataScreenState();
}

class _TambahDataScreenState extends State<TambahDataScreen> {
  final namaBarang =  TextEditingController();
  final hargaBarang = TextEditingController();

  @override
  void dispose() {
    namaBarang.dispose();
    hargaBarang.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderTambahBarang>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      appBar: AppBar(
        title: Text("Tambah Barang"),
        backgroundColor: Color(0xff7165FF),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Unit",
                      style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: namaBarang,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Nama Barang",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Tambah Unit",
                      style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            prov.subtrValUnit();
                          },
                          child: Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(51, 26),
                              primary: Color(0xff7165FF)),
                        ),
                        Consumer<ProviderTambahBarang>(
                          builder: (context, data, _) {
                            return Text(
                              data.valUnit.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        ),
                        ElevatedButton(
                          onPressed: () {
                            prov.addValUnit();
                          },
                          child: Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(51, 26),
                              primary: Color(0xff7165FF)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Text(
                    //   "Unit Tersisa : 24 Unit",
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Color(0xff001893),
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 20),
                    Text(
                      "Harga Per Unit Untuk Dijual",
                      style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    ),
                    TextField(
                      controller: hargaBarang,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Harga",
                        icon: Text(
                          "Rp.",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff676767)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await prov.addBarang(Barang(null, namaBarang.text.toString(), int.parse(hargaBarang.text), prov.valUnit));
                  Navigator.pop(context, true);
                },
                child: Text(
                  "Tambah",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(123, 26), primary: Color(0xff7165FF)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 18),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  "Batal",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(123, 26), primary: Color(0xff7165FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

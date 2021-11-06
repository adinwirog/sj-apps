import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:sarangjembar_apps/screens/detail_barang.dart';
import 'package:sarangjembar_apps/screens/tambah_barang.dart';

class DaftarBarangView extends StatefulWidget {
  const DaftarBarangView({Key? key}) : super(key: key);

  @override
  _DaftarBarangViewState createState() => _DaftarBarangViewState();
}

class _DaftarBarangViewState extends State<DaftarBarangView> {
  List<Barang> _barang = [
    Barang(nama: "Mizone", hargaPerUnit: 1000, jumlahUnit: 20),
    Barang(nama: "Yuzu", hargaPerUnit: 1000, jumlahUnit: 20),
    Barang(nama: "Milkuat", hargaPerUnit: 1000, jumlahUnit: 10),
    Barang(nama: "Milkuat Bantal", hargaPerUnit: 2000, jumlahUnit: 20),
    Barang(nama: "Ozone", hargaPerUnit: 1000, jumlahUnit: 20),
  ];

  List<Barang> _barangToDisplay = [];

  @override
  void initState() {
    setState(() {
      _barangToDisplay = _barang;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      body: Padding(
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
                text = text.toLowerCase();
                setState(() {
                  _barangToDisplay = _barang.where((barang) {
                    var namaBarang = barang.nama.toLowerCase();
                    return namaBarang.contains(text);
                  }).toList();
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _barangToDisplay.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailBarangScreen();
                        },
                      ));
                    },
                    title: Text(
                      "${_barangToDisplay[index].nama}",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      "Rp. ${_barangToDisplay[index].hargaPerUnit}/unit",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      "${_barangToDisplay[index].jumlahUnit} Unit",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TambahDataScreen();
            },
          ));
        },
        backgroundColor: Color(0xff7165FF),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

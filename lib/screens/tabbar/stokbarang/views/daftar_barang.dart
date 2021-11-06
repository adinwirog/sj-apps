import 'package:flutter/material.dart';
import 'package:sarangjembar_apps/screens/detail_barang.dart';

class DaftarBarangView extends StatefulWidget {
  const DaftarBarangView({Key? key}) : super(key: key);

  @override
  _DaftarBarangViewState createState() => _DaftarBarangViewState();
}

class _DaftarBarangViewState extends State<DaftarBarangView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDEA),
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
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
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
                      "Barang $index",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      "Rp. ${index * 2000}/unit",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      "${index * 5} Unit",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

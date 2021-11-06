import 'package:flutter/material.dart';

class TambahDataScreen extends StatefulWidget {
  const TambahDataScreen({Key? key}) : super(key: key);

  @override
  _TambahDataScreenState createState() => _TambahDataScreenState();
}

class _TambahDataScreenState extends State<TambahDataScreen> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "Barang 1",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
                          onPressed: () {},
                          child: Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(51, 26),
                              primary: Color(0xff7165FF)),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(51, 26),
                              primary: Color(0xff7165FF)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Unit Tersisa : 24 Unit",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff001893),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Harga Per Unit Untuk Dijual",
                      style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    ),
                    TextField(
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
                onPressed: () {},
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
                onPressed: () {},
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

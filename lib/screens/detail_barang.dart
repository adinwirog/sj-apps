import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/models/unit_barang.dart';
import 'package:sarangjembar_apps/providers/provider_editbarang.dart';

class DetailBarangScreen extends StatefulWidget {
  final barang;
  const DetailBarangScreen({Key? key, this.barang}) : super(key: key);

  @override
  _DetailBarangScreenState createState() => _DetailBarangScreenState();
}

class _DetailBarangScreenState extends State<DetailBarangScreen> {
  late final namaBarang;
  late final hargaBarang;
  // late final a;

  @override
  void initState() {
    namaBarang = TextEditingController(text: widget.barang.nama.toString());
    hargaBarang =
        TextEditingController(text: widget.barang.hargaPerUnit.toString());
    super.initState();
  }

  @override
  void dispose() {
    namaBarang.dispose();
    hargaBarang.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderEditBarang>(context, listen: false);
    prov.initial(widget.barang.jumlahUnit);
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      appBar: AppBar(
        title: Text("Detail Barang"),
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
                    TextFormField(
                      // initialValue: widget.barang.nama.toString(),
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
                      "Ubah Unit",
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
                        Consumer<ProviderEditBarang>(
                            builder: (context, data, _) {
                          return Text(
                            data.valUnit.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        }),
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
                    Text(
                      "Unit Tersisa : ${widget.barang.jumlahUnit} Unit",
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
                    TextFormField(
                      // initialValue: widget.barang.hargaPerUnit.toString(),
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
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Peringatan"),
                      content: Text(
                          "Anda yakin ingin mengubah? Ini akan berdampak pada laporan akhir"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("Tidak")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text("Ya")),
                      ],
                    ),
                  ).then((value) async {
                    if (value == true) {
                      await prov.editBarang(Barang(
                          widget.barang.id,
                          namaBarang.text.toString(),
                          int.parse(hargaBarang.text),
                          prov.valUnit));
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Peringatan"),
                          content: Text("Data berhasil disimpan"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                      ).then((value) => Navigator.pop(context, value));
                    }
                  });
                  // await prov.editBarang(Barang(widget.barang.id, namaBarang.text.toString(), int.parse(hargaBarang.text), prov.valUnit));
                  // Navigator.pop(context, true);
                },
                child: Text(
                  "Ubah",
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
                  prov.resetValunit();
                  Navigator.pop(context);
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

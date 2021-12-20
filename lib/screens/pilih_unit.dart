import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarangjembar_apps/providers/provider_barang.dart';

class PilihUnitBarangScreen extends StatefulWidget {
  const PilihUnitBarangScreen({Key? key}) : super(key: key);

  @override
  _PilihUnitBarangScreenState createState() => _PilihUnitBarangScreenState();
}

class _PilihUnitBarangScreenState extends State<PilihUnitBarangScreen> {
  late final _search;

  @override
  void initState() {
    // setState(() {
    //   // _barangToDisplay = _barang;
    // });
    _search = TextEditingController();
    // _currfoc = FocusScope();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    // _currfoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Unit Barang"),
        backgroundColor: Color(0xff7165FF),
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: FutureBuilder(
        future:
            Provider.of<ProviderBarang>(context, listen: false).fetchingData(),
        builder: (context, snapshot) {
          return Consumer<ProviderBarang>(
            builder: (context, data, _) {
              return Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _search,
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
                          onPressed: () {
                            setState(() {
                              _search.clear();
                            });
                          },
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
                              onTap: () {
                                if (data.barangdisplay[index].jumlahUnit < 1) {
                                } else {
                                  Navigator.pop(
                                      context, data.barangdisplay[index]);
                                }
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
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        (data.barangdisplay[index].jumlahUnit ==
                                                0)
                                            ? Colors.red
                                            : Color(0xff001893)),
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

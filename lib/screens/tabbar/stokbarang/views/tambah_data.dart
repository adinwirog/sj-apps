import 'package:flutter/material.dart';

class TambahDataView extends StatefulWidget {
  const TambahDataView({Key? key}) : super(key: key);

  @override
  _TambahDataViewState createState() => _TambahDataViewState();
}

class _TambahDataViewState extends State<TambahDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDEA),
      body: Center(child: Text("Tambah Data")),
    );
  }
}

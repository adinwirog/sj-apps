import 'package:flutter/material.dart';

class DaftarViewState extends StatefulWidget {
  const DaftarViewState({Key? key}) : super(key: key);

  @override
  _DaftarViewStateState createState() => _DaftarViewStateState();
}

class _DaftarViewStateState extends State<DaftarViewState> {
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
                hintText: "Cari Nama/Alamat ...",
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
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      "Adin",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      "Jl gangsa unit",
                      style: TextStyle(fontSize: 16, color: Color(0xff676767)),
                    ),
                    trailing: Text(
                      "Rp. 3000",
                      style: TextStyle(fontSize: 20, color: Color(0xffEE0000)),
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

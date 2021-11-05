import 'package:flutter/material.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  _TransaksiViewState createState() => _TransaksiViewState();
}

class _TransaksiViewState extends State<TransaksiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDEA),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              width: 387,
              // height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Nama",
                    //   style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                    // ),
                    SizedBox(
                      height: 26,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Nama",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 26,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Alamat",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Switch.adaptive(value: true, onChanged: (value) {}),
                        SizedBox(
                          width: 32,
                        ),
                        Text(
                          "Melakukan Bon?",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff676767)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff7165FF),
                    ),
                  ),
                )
              ],
            )),
            ElevatedButton(onPressed: () {}, child: Text("Bayar")),
            Container(
              // width: 387,
              // height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xff22a1fd),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total :",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "Rp. 0",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Bayar :",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //     Text(
                    //       "Rp. 3000",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Selisih :",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //     Text(
                    //       "Rp. 3000",
                    //       style: TextStyle(fontSize: 18, color: Colors.white),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

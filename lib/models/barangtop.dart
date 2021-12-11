class BarangTop {
  String? namabarang;
  int? terjual;


  BarangTop(this.namabarang, this.terjual);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'namabarang': namabarang,
      'terjual': terjual,
    };
    return map;
  }

  BarangTop.fromMap(Map<String, dynamic> map) {
    namabarang = map['namabarang'];
    terjual = map['terjual'];
  }
}

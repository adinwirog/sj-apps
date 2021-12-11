class Laporan {
  int? id;
  String? namaCustomer;
  String? alamatCustomer;
  String? tanggal;
  int? bon;
  int? qty;
  String? namabarang;
  int? hargabarang;

  Laporan(this.id, this.namaCustomer, this.alamatCustomer, this.tanggal,
      this.bon, this.qty, this.namabarang, this.hargabarang);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'namacustomer': namaCustomer,
      'alamatcustomer': alamatCustomer,
      'tanggaltransaksi': tanggal,
      'bon': bon,
      'qty': qty,
      'namabarang': namabarang,
      'hargabarang': hargabarang,
    };
    return map;
  }

  Laporan.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namaCustomer = map['namacustomer'];
    alamatCustomer = map['alamatcustomer'];
    tanggal = map['tanggaltransaksi'];
    bon = map['bon'];
    qty = map['qty'];
    namabarang = map['namabarang'];
    hargabarang = map['hargabarang'];
  }
}

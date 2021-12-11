
class Transaksi {
  int? id;
  String? namaCustomer;
  String? alamatCustomer;
  String? tanggal;
  int? bon;
  int? qty;
  int? idbarang;

  Transaksi(this.id, this.namaCustomer, this.alamatCustomer, this.tanggal,
      this.bon, this.qty, this.idbarang);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'namacustomer': namaCustomer,
      'alamatcustomer': alamatCustomer,
      'tanggaltransaksi': tanggal,
      'bon': bon,
      'qty': qty,
      'idbarang': idbarang,
    };
    return map;
  }

  Transaksi.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namaCustomer = map['namacustomer'];
    alamatCustomer = map['alamatcustomer'];
    tanggal = map['tanggaltransaksi'];
    bon = map['bon'];
    qty = map['qty'];
    idbarang = map['idbarang'];
  }
}

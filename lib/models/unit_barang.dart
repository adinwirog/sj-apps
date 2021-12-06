class Barang {
  int? id;
  String? nama;
  int? hargaPerUnit;
  int? jumlahUnit;

  Barang(this.id, this.nama, this.hargaPerUnit, this.jumlahUnit);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nama': nama,
      'hargaperunit': hargaPerUnit,
      'jumlahunit': jumlahUnit,
    };
    return map;
  }

  Barang.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    hargaPerUnit = map['hargaperunit'];
    jumlahUnit = map['jumlahunit'];
  }
}

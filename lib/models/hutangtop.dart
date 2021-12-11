class HutangTop {
  String? namacustomer;
  String? alamatcustomer;
  int? hutang;


  HutangTop(this.namacustomer, this.alamatcustomer, this.hutang);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'namacustomer': namacustomer,
      'alamatcustomer': alamatcustomer,
      'hutang': hutang,
    };
    return map;
  }

  HutangTop.fromMap(Map<String, dynamic> map) {
    namacustomer = map['namacustomer'];
    alamatcustomer = map['alamatcustomer'];
    hutang = map['hutang'];
  }
}
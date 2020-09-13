import 'package:pujas_eat_demo/src/model.dart';

import 'package:http/http.dart' as http;

class Pemesanan {
  String id;
  String tglPesan;
  Null tglBayar;
  int totalBayar;
  String status;
  Kasir kasir;

  Pemesanan(
      {this.id,
      this.tglPesan,
      this.tglBayar,
      this.totalBayar,
      this.status,
      this.kasir});

  Pemesanan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tglPesan = json['tgl_pesan'];
    tglBayar = json['tgl_bayar'];
    totalBayar = json['total_bayar'];
    status = json['status'];
    kasir = json['kasir'] != null ? new Kasir.fromJson(json['kasir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tgl_pesan'] = this.tglPesan;
    data['tgl_bayar'] = this.tglBayar;
    data['total_bayar'] = this.totalBayar;
    data['status'] = this.status;
    if (this.kasir != null) {
      data['kasir'] = this.kasir.toJson();
    }
    return data;
  }

  static Future<List<Pemesanan>> getDetailPemesanan() async {
    String apiURL = "http://192.168.43.56:8888/detail_pemesanan/menu/T01";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listPemesanan = (jsonObject);

    List<Pemesanan> pemesanan = [];
    for (int i = 0; i < listPemesanan.length; i++)
      pemesanan.add(Pemesanan.fromJson(listPemesanan[i]));
    
    // print(pemesanan[0].kategori);
    return pemesanan;
  }
}
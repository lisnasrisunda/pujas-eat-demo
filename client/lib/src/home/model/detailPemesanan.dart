import 'package:pujas_eat_demo/src/model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailPemesanan {
  int id;
  int harga;
  int qty;
  String keterangan;
  Menu menu;
  Pemesanan pemesanan;

  DetailPemesanan(
      {this.id,
      this.harga,
      this.qty,
      this.keterangan,
      this.menu,
      this.pemesanan});

  DetailPemesanan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    harga = json['harga'];
    qty = json['qty'];
    keterangan = json['keterangan'];
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
    pemesanan =
        json['pemesanan'] != null ? new Pemesanan.fromJson(json['pemesanan']) : null;
    // menu = json['id'];
    // pemesanan = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['harga'] = this.harga;
    data['qty'] = this.qty;
    data['keterangan'] = this.keterangan;
    // data['menu'] = this.menu;
    // data['pemesanan'] = this.pemesanan;
    if (this.menu != null) {
      data['menu'] = this.menu.toJson();
    }
    if (this.pemesanan != null) {
      data['pemesanan'] = this.pemesanan.toJson();
    }
    return data;
  }

  static Future<List<DetailPemesanan>> getDetailPemesanan() async {
    String apiURL = "http://192.168.43.56:8888/detail_pemesanan";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listPemesanan = (jsonObject);

    List<DetailPemesanan> pemesanan = [];
    for (int i = 0; i < listPemesanan.length; i++)
      pemesanan.add(DetailPemesanan.fromJson(listPemesanan[i]));
    
    print(pemesanan[0].pemesanan.id);
    return pemesanan;
  }
}
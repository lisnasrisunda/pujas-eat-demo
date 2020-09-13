import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pujas_eat_demo/src/model.dart';

class DetailPemesananModel {
  String id;
  int harga;
  int qty;
  String keterangan;
  MenuModel menu;
  // String idMenu;
  // String idKasir;
  // String namaMenu;
  // String hargaMenu;
  // String kategoriMenu;
  // String idPemesanan;

  String get idPemesanan {
    return id;
  }

  void set idPemesanan(String _id) {
    id = _id;
  }

  int get hargaMenu {
    return harga;
  }

  void set hargaMenu(int _harga) {
    harga = _harga;
  }

  int get qtyMenu {
    return qty;
  }

  void set qtyMenu(int _qty) {
    qty = _qty;
  }

  String get keteranganPemesanan {
    return keterangan;
  }

  void set keteranganPemesanan(String _keterangan) {
    keterangan = _keterangan;
  }

  MenuModel get menuPemesanan {
    return menu;
  }

  void set menuPemesanan(MenuModel _menu) {
    menu = _menu;
  }

  // String get idMenuPemesanan {
  //   return idMenu;
  // }

  // void set idMenuPemesanan(String _id) {
  //   idMenu = _id;
  // }

  // String get idKasirPemesanan {
  //   return idKasir;
  // }

  // void set idKasirPemesanan(String _id) {
  //   idKasir = _id;
  // }

  DetailPemesananModel({this.id,this.harga, this.qty, this.keterangan});

  factory DetailPemesananModel.setDetailPemesanan(Map<String, dynamic> object) {
    return DetailPemesananModel(
        id: object['id'].toString(),
        harga: object['harga'],
        qty: object['qty'],
        keterangan: object['keterangan']
      );
  }

  static Future<List<DetailPemesananModel>> getDetailPemesanan() async {
    String apiURL = "http://192.168.43.56:8888/detail_pemesanan";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listDetailPemesanan = (jsonObject);

    List<DetailPemesananModel> detailPemesanan = [];
    for (int i = 0; i < listDetailPemesanan.length; i++)
      detailPemesanan.add(DetailPemesananModel.setDetailPemesanan(listDetailPemesanan[i]));
      // detailPemesanan.
    return detailPemesanan;
  } 
}
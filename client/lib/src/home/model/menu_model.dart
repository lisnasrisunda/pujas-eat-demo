import 'dart:convert';

import 'package:http/http.dart' as http;

class MenuModel {
  String id;
  String nama;
  int harga;
  String kategori;

  String get idMenu {
    return id;
  }

  void set idMenu(String _id) {
    id = _id;
  }

  String get namaMenu {
    return nama;
  }

  void set namaMenu(String _nama) {
    nama = _nama;
  }

  int get hargaMenu {
    return harga;
  }

  void set hargaMenu(int _harga) {
    harga = _harga;
  }

  String get kategoriMenu {
    return kategori;
  }

  void set kategoriMenu(String _kategori) {
    kategori = _kategori;
  }

  MenuModel({this.id, this.nama, this.harga, this.kategori});

  factory MenuModel.orderMenu(Map<String, dynamic> object) {
    return MenuModel(
        id: object['id'],
        nama: object['nama'].toString(),
        harga: object['harga'],
        kategori: object['kategori']
      );
  }

  static Future<List<MenuModel>> orderMenuList(String id) async {
    String apiURL = "http://192.168.43.56:8888/menu/tenan/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listMenu = (jsonObject);

    List<MenuModel> menu = [];
    for (int i = 0; i < listMenu.length; i++)
      menu.add(MenuModel.orderMenu(listMenu[i]));

    return menu;
  }
}

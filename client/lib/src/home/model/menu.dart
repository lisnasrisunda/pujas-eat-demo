import 'package:pujas_eat_demo/src/model.dart';
import 'package:http/http.dart' as http;

class Menu {
  String id;
  String nama;
  int harga;
  String kategori;
  Tenan tenan;

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

  Tenan get tenanMenu {
    return tenan;
  }

  void set tenanMenu(Tenan _tenan) {
    tenan = _tenan;
  }

  Menu({this.id, this.nama, this.harga, this.kategori, this.tenan});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    harga = json['harga'];
    kategori = json['kategori'];
    tenan = json['tenan'] != null ? new Tenan.fromJson(json['tenan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['harga'] = this.harga;
    data['kategori'] = this.kategori;
    if (this.tenan != null) {
      data['tenan'] = this.tenan.toJson();
    }
    return data;
  }

  static Future<List<Menu>> getMenuList(String id) async {
    String apiURL = "http://192.168.43.56:8888/menu/tenan/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listMenu = (jsonObject);

    List<Menu> menu = [];
    for (int i = 0; i < listMenu.length; i++)
      menu.add(Menu.fromJson(listMenu[i]));

    print(menu[0].kategori);
    return menu;
  }
}
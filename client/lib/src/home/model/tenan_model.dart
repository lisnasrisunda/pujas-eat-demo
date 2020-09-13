import 'dart:convert';

import 'package:http/http.dart' as http;

class TenanModel {
  String id;
  String nama;
  String pemilik;
  String nomor;
  String email;
  String alamat;

  String get idTenan {
    return id;
  }

  void set idTenan(String _id) {
    id = _id;
  }

  String get namaTenan {
    return nama;
  }

  void set namaTenan(String _nama) {
    nama = _nama;
  }

  String get pemilikTenan {
    return pemilik;
  }

  void set pemilikTenan(String _pemilik) {
    pemilik = _pemilik;
  }

  String get nomorTenan {
    return nomor;
  }

  void set nomorTenan(String _nomor) {
    nomor = _nomor;
  }

  String get emailTenan {
    return email;
  }

  void set emailTenan(String _email) {
    email = _email;
  }

  String get alamatTenan {
    return alamat;
  }

  void set alamatTenan(String _alamat) {
    alamat = _alamat;
  }

  TenanModel({this.id, this.nama,this.pemilik, this.nomor,this.email,this.alamat});

  factory TenanModel.setTenan(Map<String, dynamic> object) {
    return TenanModel(
        id: object['id'],
        nama: object['nama_tenan'].toString(),
        pemilik: object['nama_pemilik'],
        nomor: object['nomor_telepon'],
        email: object['email'],
        alamat: object['alamat']
      );
  }

  static Future<List<TenanModel>> getTenanList() async {
    String apiURL = "http://192.168.43.56:8888/tenan";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listTenan = (jsonObject);

    List<TenanModel> tenan = [];
    print(tenan.length.toString());
    for (int i = 0; i < listTenan.length; i++)
      tenan.add(TenanModel.setTenan(listTenan[i]));

    return tenan;
  }

  static Future<List<TenanModel>> getTenanById(String id) async {
    String apiURL = "http://192.168.43.56:8888/tenan/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listTenan = (jsonObject);

    List<TenanModel> tenan = [];
    print(tenan.length.toString());
    for (int i = 0; i < listTenan.length; i++)
      tenan.add(TenanModel.setTenan(listTenan[i]));

    return tenan;
  }
}

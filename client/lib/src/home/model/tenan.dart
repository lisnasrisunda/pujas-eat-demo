import 'package:pujas_eat_demo/src/model.dart';

class Tenan {
  String id;
  String namaTenan;
  String namaPemilik;
  String nomorTelepon;
  Null email;
  String alamat;
  Pengguna pengguna;

  Tenan(
      {this.id,
      this.namaTenan,
      this.namaPemilik,
      this.nomorTelepon,
      this.email,
      this.alamat,
      this.pengguna});

  Tenan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTenan = json['nama_tenan'];
    namaPemilik = json['nama_pemilik'];
    nomorTelepon = json['nomor_telepon'];
    email = json['email'];
    alamat = json['alamat'];
    pengguna = json['pengguna'] != null
        ? new Pengguna.fromJson(json['pengguna'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_tenan'] = this.namaTenan;
    data['nama_pemilik'] = this.namaPemilik;
    data['nomor_telepon'] = this.nomorTelepon;
    data['email'] = this.email;
    data['alamat'] = this.alamat;
    if (this.pengguna != null) {
      data['pengguna'] = this.pengguna.toJson();
    }
    return data;
  }
}
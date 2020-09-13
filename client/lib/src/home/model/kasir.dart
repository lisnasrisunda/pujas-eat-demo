import 'package:pujas_eat_demo/src/model.dart';

class Kasir {
  String id;
  String namaKasir;
  String nomorTelepon;
  String email;
  String alamat;
  Pengguna pengguna;

  Kasir(
      {this.id,
      this.namaKasir,
      this.nomorTelepon,
      this.email,
      this.alamat,
      this.pengguna});

  Kasir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKasir = json['nama_kasir'];
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
    data['nama_kasir'] = this.namaKasir;
    data['nomor_telepon'] = this.nomorTelepon;
    data['email'] = this.email;
    data['alamat'] = this.alamat;
    if (this.pengguna != null) {
      data['pengguna'] = this.pengguna.toJson();
    }
    return data;
  }
}
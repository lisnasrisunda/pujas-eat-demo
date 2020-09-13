class Pengguna {
  String username;
  String password;
  String role;
  String tglBergabung;
  Null tglKeluar;
  bool status;

  Pengguna(
      {this.username,
      this.password,
      this.role,
      this.tglBergabung,
      this.tglKeluar,
      this.status});

  Pengguna.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    role = json['role'];
    tglBergabung = json['tgl_bergabung'];
    tglKeluar = json['tgl_keluar'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['tgl_bergabung'] = this.tglBergabung;
    data['tgl_keluar'] = this.tglKeluar;
    data['status'] = this.status;
    return data;
  }
}
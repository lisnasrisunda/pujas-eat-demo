import 'package:pujas_eat_demo/src/model.dart';

class Cart {
  String id;
  DateTime tglPesan;
  DateTime tglBayar;
  int totalBayar;
  String status;
  String idKasir;
  List<Carts> carts;

  String get idCart {
    return id;
  }

  void set idCart(String _id) {
    id = _id;
  }

  DateTime get tglPesanCart {
    return tglPesan;
  }

  void set tglPesanCart(DateTime _tgl) {
    tglPesan = _tgl;
  }

  DateTime get tglBayarCart {
    return tglBayar;
  }

  void set tglBayarCart(DateTime _tgl) {
    tglBayar = _tgl;
  }

  int get totalBayarCart {
    return totalBayar;
  }

  void set totalBayarCart(int _total) {
    totalBayar = _total;
  }

  String get statusCart {
    return status;
  }

  void set statusCart(String _status) {
    status = _status;
  }

  String get idkasirCart {
    return idKasir;
  }

  void set idKasirCart(String _id) {
    idKasir = _id;
  }

  List<Carts> get listCart {
    return carts;
  }

  void set listCart(List<Carts> _cart) {
    carts = _cart;
  }

  Cart({
    this.id,
    this.tglPesan,
    this.tglBayar,
    this.totalBayar,
    this.status,
    this.idKasir,
    this.carts
  });
}
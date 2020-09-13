import 'package:pujas_eat_demo/src/model.dart';

class Carts {
  int harga;
  int qty;
  String keterangan;
  Menu menu;

  int get hrgaCarts {
    return harga;
  }

  void set hargaCarts(int _harga) {
    harga = _harga;
  }

  int get qtyCarts {
    return qty;
  }

  void set qtyCart(int _qty) {
    qty = _qty;
  }

  String get keteranganCarts {
    return keterangan;
  }

  void set keteranganCarts(String _ket) {
    keterangan = _ket;
  }

  Menu get menuCart {
    return menu;
  }

  void set statusCart(Menu _menu) {
    menu = _menu;
  }

  Carts({
    this.harga,
    this.qty,
    this.keterangan,
    this.menu
  });
}
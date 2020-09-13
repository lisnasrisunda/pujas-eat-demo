import 'package:server/server.dart';
import 'package:server/model/tenan.dart';
import 'package:server/model/detail_pemesanan.dart';

class Menu extends ManagedObject<_Menu> implements _Menu {}

@Table(name: "MENU")
class _Menu{
  @Column(primaryKey: true, unique: true)
  String id;
  
  String nama;
  
  int harga;

  String kategori;

  @Relate(#menu)
  Tenan tenan;

  ManagedSet<DetailPemesanan> detailPemesanan;
}
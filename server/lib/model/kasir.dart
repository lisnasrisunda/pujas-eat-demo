import 'package:server/server.dart';
import 'package:server/model/pengguna.dart';
import 'package:server/model/pemesanan.dart';

class Kasir extends ManagedObject<_Kasir> implements _Kasir {}

@Table(name: "KASIR")
class _Kasir {
  @Column(primaryKey: true, unique: true)
  String id;

  String nama_kasir;

  @Column(nullable: true)
  String nomor_telepon;
  
  @Column(nullable: true)
  String email;
  
  String alamat;

  @Relate(#kasir)
  Pengguna pengguna;

  ManagedSet<Pemesanan> pemesanan;
}
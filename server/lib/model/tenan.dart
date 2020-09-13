import 'package:server/server.dart';
import 'package:server/model/pengguna.dart';
import 'package:server/model/menu.dart';

class Tenan extends ManagedObject<_Tenan> implements _Tenan {}

@Table(name: "TENAN")
class _Tenan {
  @Column(primaryKey: true, unique: true)
  String id;

  String nama_tenan;
  
  String nama_pemilik;
  
  @Column(nullable: true)
  String nomor_telepon;
  
  @Column(nullable: true)
  String email;

  @Column(nullable: true)
  String alamat;

  @Relate(#tenan)
  Pengguna pengguna;

  ManagedSet<Menu> menu;
}
import 'package:server/server.dart';
import 'package:server/model/tenan.dart';
import 'package:server/model/kasir.dart';

class Pengguna extends ManagedObject<_Pengguna> implements _Pengguna {}

@Table(name: "PENGGUNA")
class _Pengguna {
  @Column(primaryKey: true, unique: true)
  String username;

  String password;
  
  String role;
  
  DateTime tgl_bergabung;

  @Column(nullable: true)
  DateTime tgl_keluar;
  
  bool status;

  Tenan tenan;

  Kasir kasir;
}
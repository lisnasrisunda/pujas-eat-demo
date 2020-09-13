import 'package:server/server.dart';
import 'package:server/model/kasir.dart';
import 'package:server/model/detail_pemesanan.dart';

class Pemesanan extends ManagedObject<_Pemesanan> implements _Pemesanan {}

@Table(name: "PEMESANAN")
class _Pemesanan{
  @Column(primaryKey: true, unique: true)
  String id;

  DateTime tgl_pesan;
  
  @Column(nullable: true)
  DateTime tgl_bayar;
  
  int total_bayar;
  
  String status;

  @Relate(#pemesanan)
  Kasir kasir;

  ManagedSet<DetailPemesanan> detailPemesanan;
}
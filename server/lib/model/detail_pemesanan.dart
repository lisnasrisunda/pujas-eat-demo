import 'package:server/server.dart';
import 'package:server/model/menu.dart';
import 'package:server/model/pemesanan.dart';

class DetailPemesanan extends ManagedObject<_DetailPemesanan> implements _DetailPemesanan {}

@Table(name: "DETAIL_PEMESANAN")
class _DetailPemesanan{
  @Column(primaryKey: true, unique: true, autoincrement: true)
  int id;

  int harga;
  
  int qty;
  
  @Column(nullable: true)
  String keterangan;

  @Relate(#detailPemesanan)
  Menu menu;

  @Relate(#detailPemesanan)
  Pemesanan pemesanan;
}
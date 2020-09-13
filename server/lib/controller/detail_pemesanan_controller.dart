import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/detail_pemesanan.dart';
import 'package:server/model/menu.dart';

class DetailPemesananController extends ResourceController {
  DetailPemesananController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllDetailPemesanan() async {
    final detailQuery = Query<DetailPemesanan>(context);
    final detail = await detailQuery.fetch();

    return Response.ok(detail);
  }

  @Operation.get('id')
  Future<Response> getDetailPemesananById(@Bind.path('id') int id) async {
    final detailQuery = Query<DetailPemesanan>(context)..where((h) => h.id).equalTo(id);
    final detail = await detailQuery.fetchOne();
    if(detail == null) {
      return Response.notFound();
    }
    return Response.ok(detail);
  }

  @Operation.get('menu')
  Future<Response> getDetailPemesanan(@Bind.path('menu') String menu) async {
    // final query = Query<DetailPemesanan>(context)..where((d) => d.menu.tenan.id).equalTo('menu')..join(set: (d) => d.detailPemesanan);
    final detailQuery = Query<Menu>(context)
      ..join(set: (d) => d.detailPemesanan)..where((e) => e.tenan.id).equalTo(menu);
    
    final detail = await detailQuery.fetch();
    if(detail == null) {
      return Response.notFound();
    }
    return Response.ok(detail);
  }

  @Operation.post()
  Future<Response> createPemesanan(@Bind.body() DetailPemesanan inputPemesanan) async {
    final query = Query<DetailPemesanan>(context)
      ..values = inputPemesanan;
    final insertedPemesanan = await query.insert();
      
    return Response.ok(insertedPemesanan);
  }
}
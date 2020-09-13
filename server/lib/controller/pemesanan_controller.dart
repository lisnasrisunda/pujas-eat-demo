import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/pemesanan.dart';

class PemesananController extends ResourceController {
  PemesananController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllPemesanan() async {
    final pemesananQuery = Query<Pemesanan>(context);
    final pemesanan = await pemesananQuery.fetch();

    return Response.ok(pemesanan);
  }

  @Operation.get('id')
  Future<Response> getPemesananById(@Bind.path('id') String id) async {
    final pemesananQuery = Query<Pemesanan>(context)..where((h) => h.id).equalTo(id);
    final pemesanan = await pemesananQuery.fetchOne();
    if(pemesanan == null) {
      return Response.notFound();
    }
    return Response.ok(pemesanan);
  }

  @Operation.post()
  Future<Response> createPemesanan(@Bind.body() Pemesanan inputPemesanan) async {
    final query = Query<Pemesanan>(context)
      ..values = inputPemesanan;
    final insertedPemesanan = await query.insert();
      
    return Response.ok(insertedPemesanan);
  }
}
import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/kasir.dart';

class KasirController extends ResourceController {
  KasirController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllKasir() async {
    final kasirQuery = Query<Kasir>(context);
    final kasir = await kasirQuery.fetch();

    return Response.ok(kasir);
  }

  @Operation.get('id')
  Future<Response> getKasirById(@Bind.path('id') String id) async {
    final kasirQuery = Query<Kasir>(context)..where((h) => h.id).equalTo(id);
    final kasir = await kasirQuery.fetchOne();
    if(kasir == null) {
      return Response.notFound();
    }
    return Response.ok(kasir);
  }
}
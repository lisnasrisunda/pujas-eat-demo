import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/tenan.dart';

class TenanController extends ResourceController {
  TenanController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllTenan() async {
    final tenanQuery = Query<Tenan>(context);
    final tenan = await tenanQuery.fetch();

    return Response.ok(tenan);
  }

  @Operation.get('id')
  Future<Response> getTenanById(@Bind.path('id') String id) async {
    final tenanQuery = Query<Tenan>(context)..where((h) => h.id).equalTo(id);
    final tenan = await tenanQuery.fetch();
    if(tenan == null) {
      return Response.notFound();
    }
    return Response.ok(tenan);
  }
}
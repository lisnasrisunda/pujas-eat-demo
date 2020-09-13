import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/pengguna.dart';

class PenggunaController extends ResourceController {
  PenggunaController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllPengguna() async {
    final penggunaQuery = Query<Pengguna>(context);
    final pengguna = await penggunaQuery.fetch();

    return Response.ok(pengguna);
  }

  @Operation.get('username')
  Future<Response> getPenggunaById(@Bind.path('username') String username) async {
    final penggunaQuery = Query<Pengguna>(context)..where((h) => h.username).equalTo(username);
    final pengguna = await penggunaQuery.fetchOne();
    if(pengguna == null) {
      return Response.notFound();
    }
    return Response.ok(pengguna);
  }
}
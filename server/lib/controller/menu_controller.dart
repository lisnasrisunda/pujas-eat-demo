import 'package:aqueduct/aqueduct.dart';
import 'package:server/server.dart';
import 'package:server/model/menu.dart';

class MenuController extends ResourceController {
  MenuController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllMenu() async {
    final menuQuery = Query<Menu>(context);
    final menu = await menuQuery.fetch();

    return Response.ok(menu);
  }

  @Operation.get('id')
  Future<Response> getMenuById(@Bind.path('id') String id) async {
    final menuQuery = Query<Menu>(context)..where((h) => h.id).equalTo(id);
    final menu = await menuQuery.fetchOne();
    if(menu == null) {
      return Response.notFound();
    }
    return Response.ok(menu);
  }

  @Operation.get('tenan')
  Future<Response> getMenuByIdTenan(@Bind.path('tenan') String tenan) async {
    final menuQuery = Query<Menu>(context)..where((h) => h.tenan.id).equalTo(tenan);
    final menu = await menuQuery.fetch();
    if(menu == null) {
      return Response.notFound();
    }
    return Response.ok(menu);
  }
}
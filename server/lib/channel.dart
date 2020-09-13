import 'package:server/controller/pengguna_controller.dart';
import 'package:server/controller/tenan_controller.dart';
import 'package:server/controller/menu_controller.dart';
import 'package:server/controller/kasir_controller.dart';
import 'package:server/controller/pemesanan_controller.dart';
import 'package:server/controller/detail_pemesanan_controller.dart';
import 'server.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ServerChannel extends ApplicationChannel {
  ManagedContext context;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", "password", "localhost", 5435, "pujasera");

    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });
    
    router
      .route('/pengguna/[:username]')
      .link(() => PenggunaController(context));

    router
      .route('/tenan/[:id]')
      .link(() => TenanController(context));

    router
      .route('/menu/[:id]')
      .link(() => MenuController(context));
    
    router
      .route('/menu/tenan/[:tenan]')
      .link(() => MenuController(context));

    router
      .route('/kasir/[:id]')
      .link(() => KasirController(context));

    router
      .route('/pemesanan/[:id]')
      .link(() => PemesananController(context));

    router
      .route('/detail_pemesanan/[:id]')
      .link(() => DetailPemesananController(context));

    router
      .route('/detail_pemesanan/menu/[:menu]')
      .link(() => DetailPemesananController(context));

    return router;
  }
}
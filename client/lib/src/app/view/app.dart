import 'package:pujas_eat_demo/src/view.dart';


class PujasExampleApp extends AppView {
  PujasExampleApp()
      : super(
    title: 'Pujas Plugin Example',
    debugShowCheckedModeBanner: false,
    home: HomeTenanPage(),
    navigatorObservers: [NavListener()],
    theme: ThemeData(
      fontFamily: 'Roboto',
      primarySwatch: Colors.cyan,
    ),
  );
}

class NavListener extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (navigator == null)
      print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print("route ${newRoute?.toString()} previous ${oldRoute?.toString()}");
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("route ${route?.toString()} previous ${previousRoute?.toString()}");
  }

  @override
  void didStopUserGesture() {
    print("The gesture stopped.");
  }
}
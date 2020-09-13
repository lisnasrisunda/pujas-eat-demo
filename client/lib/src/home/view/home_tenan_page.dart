import 'package:pujas_eat_demo/src/view.dart';

class HomeTenanPage extends StatefulWidget {
  @override
  _HomeTenanPageState createState() => _HomeTenanPageState();
}

class _HomeTenanPageState extends StateMVC<HomeTenanPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              flexibleSpace: Positioned(
                  top: 20,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset('assets/logo.png', width: 50, height: 50, fit: BoxFit.fill),
                        Text('JUST-EAT',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ),
          body: Center(
            child: Container(
              height: 450,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                border: Border.all(
                  width: 20,
                  color: Colors.grey[350],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    padding: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: () async {
                      var route = MaterialPageRoute(
                        builder: (BuildContext context) => OrderPage("T01"),
                        fullscreenDialog: true,
                      );
                      await Navigator.of(context).push(route);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/pesanan.png', height: 80.0, width: 80.0,),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Order', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                          )
                        )
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.grey[350],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                    child: new RaisedButton(
                      elevation: 0.0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                      onPressed: () {
                  
                      },
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset('assets/laporan.png',
                          height: 80.0, width: 80.0),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Laporan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ))
                        ],
                      ),
                    textColor: Color(0xFF292929),
                    color: Colors.grey[350]),
                  ),
                ],
              ),
            )
          ),
          bottomNavigationBar:
              BottomNavigationBar(items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text('Notifikasi')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ]),
        ));
  }
}

import 'package:pujas_eat_demo/src/view.dart';
import 'package:pujas_eat_demo/src/model.dart';
import 'package:pujas_eat_demo/src/controller.dart';

class OrderPage extends StatefulWidget {
  final String _idTenan;

  OrderPage(this._idTenan);

  @override
  _OrderPageState createState() => _OrderPageState(this._idTenan);
}

class _OrderPageState extends StateMVC<OrderPage> {
  var listMenu = [];
  String idTenan;

  _OrderPageState(_idTenan) : super(OrderController()) {
    con = controller;
    idTenan = _idTenan;
    listMenu = con.getMenuList(_idTenan);
  }
  OrderController con;
  // List<DetailPemesananModel> _cartList = [];
  List<Carts> _cartList = [];
  int _index;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Pesan'),
              ],
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Menu"),
                Tab(text: "Checkout"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.black,
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listMenu[index].nama, style: TextStyle(fontSize: 15)),
                    trailing: Text(
                      "Rp " + "${listMenu[index].harga}",
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: (){
                      if(!con.checkCart(_cartList, listMenu[index].id)) {
                        _cartList.add(con.setCarts(listMenu[index]));
                        setState(() {});
                      } else {
                        _index = con.getCartById(_cartList, listMenu[index].id);
                        _cartList[index].qty = con.sumQty(_cartList[_index].qty);
                      }
                      // if(!con.checkCart(_cartList, listMenu[index].id)) {
                      //   _cartList.add(con.setDetail(listMenu[index]));
                      //   setState(() {});
                      // } else {
                      //   _index = con.getCartById(_cartList, listMenu[index].id);
                      //   _cartList[index].qty = con.sumQty(_cartList[_index].qty);
                      // }
                      // for (int i = 0; i < _cartList.length; i++) {
                      //   print(_cartList[i].menu.nama);
                      //   print(_cartList[i].qty);
                      // }
                    },
                  );
                },
                itemCount: listMenu.length,
              ),
                CheckoutPage(_cartList,idTenan),
                // MenuListPage(_cartList, idTenan),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:pujas_eat_demo/src/view.dart';
import 'package:pujas_eat_demo/src/controller.dart';
import 'package:pujas_eat_demo/src/model.dart';

class MenuListPage extends StatefulWidget {
  final List<DetailPemesananModel> _cart;
  final String _idTenan;

  MenuListPage(this._cart, this._idTenan);

  @override
  _MenuListPageState createState() => _MenuListPageState(this._cart,this._idTenan);
}

class _MenuListPageState extends StateMVC<MenuListPage> {
  List<DetailPemesananModel> cart;
  String idTenan;
  var tenan = [];

  _MenuListPageState(_cart,_idTenan) : super(OrderController()){    
    con = controller;
    cart = _cart;
    idTenan = _idTenan;
    tenan = con.getDetailPemesananList();
  }

  OrderController con;
  TextEditingController etKeterangan = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (cart.isNotEmpty) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return ListView(
              children: <Widget>[
                createCartList(),
              ],
            );
          },
        ),
      );
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Belum ada menu yang ditambahkan"),
            onTap: () {
              print(idTenan);
              print(tenan[0].id);
            },
          );
        },
        itemCount: 1,
      );
    }

  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(index);
      },
      itemCount: cart.length,
    );
  }

  createCartListItem(int index) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cart[index].menu.nama,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${cart[index].harga}",
                              style: TextStyle(fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.grey.shade700,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // cart[index].qty = con.minQty(cart[index].qty);
                                        print(cart[index].qty);
                                        if(cart[index].qty==0)
                                          cart.removeAt(index);
                                      });
                                    },
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                      bottom: 8, right: 12, left: 12
                                    ),
                                    child: Text(
                                      "${cart[index].qty}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.grey.shade700,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // cart[index].qty = con.sumQty(cart[index].qty);
                                        print(cart[index].qty);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}

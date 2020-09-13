import 'package:pujas_eat_demo/src/view.dart';
import 'package:pujas_eat_demo/src/controller.dart';
import 'package:pujas_eat_demo/src/model.dart';

class CheckoutPage extends StatefulWidget {
  final List<Carts> _cart;
  final String _idTenan;

  CheckoutPage(this._cart,this._idTenan);

  @override
  _CheckoutPageState createState() => _CheckoutPageState(this._cart,this._idTenan);
}

class _CheckoutPageState extends StateMVC<CheckoutPage> {
  List<Carts> cart;
  var tenan = [];
  String idTenan;

  _CheckoutPageState(_cart,_idTenan) : super(OrderController()) {
    con = controller;
    cart = _cart;
    idTenan = _idTenan;
  }
  OrderController con;
  TextEditingController myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cart.isNotEmpty) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return ListView(
              children: <Widget>[createCartList(), footer(context)],
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
          );
        },
        itemCount: 1,
      );
    }
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                    labelText: "Masukkan keterangan pesanan di sini",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                style: TextStyle(fontSize: 12.0),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "Rp " + "${con.getTotalBayar(cart)}",
                  style: TextStyle(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              )
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => StruckPage(
                          cart, myController.text, con.getTotalBayar(cart),idTenan)));
              print(myController.text);
            },
            color: Colors.red,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Cetak Struk",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
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
              borderRadius: BorderRadius.all(Radius.circular(16))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        cart[index].qty =
                                            con.minQty(cart[index].qty);
                                        print(cart[index].qty);
                                        if (cart[index].qty == 0)
                                          cart.removeAt(index);
                                      });
                                    },
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 8, right: 12, left: 12),
                                    child: Text(
                                      "${cart[index].qty}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200),
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
                                        cart[index].qty =
                                            con.sumQty(cart[index].qty);
                                        print(cart[index].qty);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   child: TextFormField(
                      //     controller: myController,
                      //     decoration: InputDecoration(
                      //       labelText: "Masukkan keterangan pesanan di sini",
                      //       fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       )
                      //     ),
                      //     style: TextStyle(fontSize: 12.0),
                      //   )
                      // ),
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

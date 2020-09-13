import 'package:pujas_eat_demo/src/view.dart';
import 'package:pujas_eat_demo/src/controller.dart';
import 'package:pujas_eat_demo/src/model.dart';
import 'package:pdf/widgets.dart' as pw;

class StruckPage extends StatefulWidget {
  final List<Carts> _cart;
  final String _keterangan;
  final int _totalBayar;
  final String _idTenan;

  StruckPage(this._cart, this._keterangan, this._totalBayar, this._idTenan);

  @override
  _StruckPageState createState() =>
      _StruckPageState(this._cart, this._keterangan, this._totalBayar, this._idTenan);
}

class _StruckPageState extends StateMVC<StruckPage> {
  OrderController con;
  List<Carts> carts;
  String keterangan;
  // int totalBayar;
  var tenan = [];
  Cart cart = null;

  _StruckPageState(_cart, _keterangan, _totalBayar, _idTenan) : super(OrderController()) {
    con = controller;
    carts = _cart;
    keterangan = _keterangan;
    // totalBayar = _totalBayar;
    tenan = con.getTenanById(_idTenan);
    cart = con.setCart(_cart, _totalBayar);
  }

  // final pdf = pw.Document();

  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        final doc = pw.Document();

        final image = await wrapWidget(
          doc.document,
          key: _printKey,
          pixelRatio: 2.0
        );

        doc.addPage(
          pw.Page(
            pageFormat: format,
            build: (pw.Context context) {
              return pw.Center(child: pw.Expanded(child: pw.Image(image),),);
            }
          )
        );
        return doc.save();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // print(
              //     cart[0].menu.nama + " " + keterangan + " " + "{$totalBayar}");
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
      ),
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              RepaintBoundary(
                key: _printKey,
                child: Container(
                  child: createStruk(),
                ),
              ),
              footer(context),
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {
                    con.printScreen(_printKey);
                  },
                  color: Colors.red,
                  padding:
                      EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Text(
                    "Cetak",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }

  createStruk() {    
    if(tenan.isNotEmpty){
      return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: <Widget>[
            headerStruk(), 
            createCartList(), 
            footerStruk()],
        ));
    } else {
      return Container(
        margin: EdgeInsets.all(8.0),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        // child: Column(
        //   children: <Widget>[
        //     footerStruk()
        //   ],
        // ),
      );
    }
  }

  headerStruk() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.black,
            margin: EdgeInsets.all(8.0),
            child: Text(
              "  JUST-EAT  ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              tenan[0].nama + ' - ' + tenan[0].id,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Date : " + cart.tglPesan.toString(), style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Time : " + cart.tglPesan.toLocal().toString(), style: TextStyle(fontSize: 10.0),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("No. Pemesanan : " + cart.id, style: TextStyle(fontSize: 10.0),)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 3.0,
            width: 350.0,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Text(
              'TAGIHAN',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 3.0,
            width: 350.0,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 150,
            child: Text(
                'Berikan struk ini ke bagian kasir untuk membayar',
                maxLines: 2,
                style: TextStyle(fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
        ),
        Center(
          child: QrImage(
            version: 6,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
            padding: EdgeInsets.all(20.0),
            size: 200.0,
            data: "000001",
          ),
        ),
      ],
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(index);
      },
      itemCount: carts.length,
    );
  }

  createCartListItem(int index) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              child: Text(
                                carts[index].menu.nama,
                                maxLines: 2,
                                softWrap: true,
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Text(
                                "x"+"${carts[index].qty}",
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Text(
                                "${carts[index].harga}",
                                style: TextStyle(fontSize: 10.0),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  footerStruk() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text("INI BUKAN BUKTI PEMBAYARAN", style: TextStyle(fontSize: 12.0),),
      ),
    );
  }
}

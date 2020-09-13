import 'package:pujas_eat_demo/src/model.dart';
import 'package:pujas_eat_demo/src/controller.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class OrderController extends ControllerMVC {
  List<Menu> getMenuList(String idTenan) {
    List<Menu> output = [];
    Menu.getMenuList(idTenan).then((menu) {
      for (int i = 0; i < menu.length; i++) 
        output.add(menu[i]);

      setState(() {});
    });

    return(output);
  }

  List<DetailPemesananModel> getDetailPemesananList() {
    List<DetailPemesananModel> output = [];
    DetailPemesananModel.getDetailPemesanan().then((detail) {
      for (int i = 0; i < detail.length; i++) 
        output.add(detail[i]);

      setState(() {});
    });

    return(output);
  }

  List<TenanModel> getTenanList() {
    List<TenanModel> output = [];
    TenanModel.getTenanList().then((tenan) {
      for (int i = 0; i < tenan.length; i++) 
        output.add(tenan[i]);

      setState(() {});
    });

    return(output);
  }

  List<TenanModel> getTenanById(String idTenan) {
    List<TenanModel> output = [];
    TenanModel.getTenanById(idTenan).then((tenan) {
      for (int i = 0; i < tenan.length; i++) 
        output.add(tenan[i]);

      setState(() {});
    });

    return(output);
  }

  bool checkCart(List<Carts> cart, String idMenu) {
    bool check = false;

    for(int i = 0; i < cart.length; i++)
      if(cart[i].menu.id == idMenu)
        check = true;

    return check;
  }

  DetailPemesananModel setDetail(MenuModel menu) {
    DetailPemesananModel pesanan = new DetailPemesananModel();
    pesanan.hargaMenu = menu.harga;
    pesanan.qtyMenu = 1;
    pesanan.keterangan = "";
    pesanan.menuPemesanan = menu;
    return pesanan;
  }

  Carts setCarts(Menu menu) {
    Carts cart = new Carts();
    cart.harga = menu.harga;
    cart.qty = 1;
    cart.keterangan = "";
    cart.menu = menu;

    return cart;
  }

  Cart setCart(List<Carts> carts, int totalBayar) {
    Cart cart = new Cart();
    cart.id = "123456";
    cart.tglPesan = DateTime.now();
    cart.tglBayar = null;
    cart.totalBayar = totalBayar;
    cart.status = "belum bayar";
    cart.idKasir = null;
    cart.carts = carts;

    return cart;
  }

  int sumQty (int qty) {
    qty = qty+1;
    return qty;
  }

  int minQty (int qty) {
    qty = qty - 1;
    return qty;
  }

  int getTotalBayar(List<Carts> cart) {
    int total = 0;

    for(int i = 0; i < cart.length; i++)
      total = total + (cart[i].harga*cart[i].qty);

    return total;
  }

  int getCartById(List<Carts> cart, String idMenu) {
    int check = 0;

    for(int i = 0; i < cart.length; i++)
      if(cart[i].menu.id == idMenu)
        check = i;

    return check;
  }

  void printScreen(GlobalKey<State<StatefulWidget>> _printKey) {
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
}
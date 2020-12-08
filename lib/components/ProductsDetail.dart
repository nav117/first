import 'package:flutter/material.dart';
import 'package:calpedelapp/components/calpedel_service.dart';

class ProductsArguments {
  final String ProdId;
  ProductsArguments(this.ProdId);
}

class ProductsDetail extends StatefulWidget {
  static const routeName = "/product";
  ProductsDetailState createState() => ProductsDetailState();
}

class ProductsDetailState extends State<ProductsDetail> {
  var _products;
  var _first = true;

  @override
  Widget build(BuildContext context) {
    if (_first) {
      _first = false;
      final ProductsArguments args = ModalRoute.of(context).settings.arguments;
      findProducts(args.ProdId).then((products) => setState(() {
        _products = products;
      }));
    }
    if (_products == null) {
      return new MaterialApp(
          home: Scaffold(
              appBar: new AppBar(title: new Text("")), body: new Text("")));
    }

    return new MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
                automaticallyImplyLeading: true,
                title: new Text(_products["CodiceCalp"]),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: new Center(
                child: new Column(children: [
                  //          new SizedBox(height: 10),
                  //          new Image.network(
                  //            _products['LinkImmagine'],
                  //            fit: BoxFit.cover,
                  //            height: 400.0,
                  //            width: 400.0,
                  //          ),
                  new SizedBox(height: 10),
                  new Text("Catalog",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  new Text("${_products['Catalogo']}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  new SizedBox(height: 10),
                  new Text("Description",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  new Text("${_products['Descrizione']}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  new SizedBox(height: 10),
                  new Text("Code",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  new Text("${_products['CodiceCalp']}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),

                ]))));
  }
}

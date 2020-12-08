import 'package:flutter/material.dart';
import 'package:calpedelapp/components/calpedel_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:calpedelapp/components/Card block.dart';
import 'package:calpedelapp/pages/cart_page.dart';

void main() {
  runApp(SF());
}

class SF extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
        create: (_) => CartBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {ProductsDetail.routeName: (context) => ProductsDetail()},
          title: 'Ricerca',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: SF1(),
        )
    );
  }
}



class SF1 extends StatefulWidget {
  SF1({Key key, this.title}) : super(key: key);
  final String title;
  @override

  ProductsState createState() => ProductsState();
}


class ProductsState extends State<SF1> {
  List products = [];

  void updateProducts(String search) {
    searchProducts(search).then((netSF1) => setState(() => products = netSF1));
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          //backgroundImage: Image.file('calpedel.jpg'),
          backgroundColor: Colors.indigo,
          title: Text('Ricerca'),
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                  height: 150.0,
                  width: 30.0,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                    child: new Stack(
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.white60,
                          ),
                          onPressed: null,
                        ),
                        new Positioned(
                            child: new Stack(
                              children: <Widget>[
                                new Icon(Icons.brightness_1,
                                    size: 20.0, color: Colors.red[700]),
                                new Positioned(
                                    top: 3.0,
                                    right: 7,
                                    child: new Center(
                                      child: new Text(
                                        '$totalCount',
                                        style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ],
                            )),
                      ],
                    ),
                  )
              ),
            )
          ],
//      actions: <Widget>[
//        new IconButton(icon: Icon(Icons.search, color: Colors.white60,), onPressed: (){})
//      ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              onChanged:
                  updateProducts, //Everytime something changes in textField
            ),
            Expanded(
                // Occupa tutta la colonna rimanente
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    // Element of the scrolling widget
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(products[index]["CodiceCalp"],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    trailing: Image.network(
                      products[index]["LinkImmagine"],
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                    onTap: () => {
                      Navigator.pushNamed(context, ProductsDetail.routeName,
                          arguments:
                          ProductsArguments(products[index]['CodiceCalp']))
                        });
              },
            ))
          ],
        ));
  }
}

class ProductsArguments {
  final String ProdId;
  ProductsArguments(this.ProdId);
}

class ProductsDetail extends StatefulWidget {
  static const routeName = "/calpedelapp";
  ProductsDetailState createState() => ProductsDetailState();
}

class ProductsDetailState extends State<ProductsDetail> {
  var _products;
  var _first = true;
  int counter=1;

  void decrementCounter() {
    setState(() {
      if (counter > 0) counter--;
    });
  }

  void incrementCounter() {
    setState(() {
      if (counter < 100) counter++;
    });
  }

  void setCounter(double val) {
    setState(() {
      counter = val.toInt();
    });
  }



  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    if (_first) {
      _first = false;
      final ProductsArguments args = ModalRoute.of(context).settings.arguments;
      findProducts(args.ProdId).then((products) => setState(() {
            _products = products;
          }
          )
      );
    }
    if (_products == null) {
      return new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: new AppBar(
                  backgroundColor: Colors.indigo,
                  title: new Text("")), body: new Text("")));
    }

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: new AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.indigo,
                title: new Text(_products["CodiceCalp"]),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: new ListView(
                children: [
             new SizedBox(height: 10),
              new InteractiveViewer(
                constrained: true,
                scaleEnabled: true,
                child: new Image.network(
                _products['LinkImmagine'],
                fit: BoxFit.cover,
              ),
              //  height: 250.0,
              //  width: 250.0,
              ),
              new SizedBox(height: 10),
              new Text("Catalogo",
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
              new Text("Descrizione",
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
              new Text("Codice",
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
                  new SizedBox(height: 10),
                  new Text("Prezzo",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  new Text("${_products['Prezzo']}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  new Divider(),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Quantità", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),)
                      ),
                      IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){
                        decrementCounter();
                      }),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("$counter", style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),)
                      ),
                      IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){
                        incrementCounter();
                      }),
                      IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){
                        //cart.add(_products['CodiceCalp']);
                        bloc.addToCart(_products['CodiceCalp'],_products['Prezzo'],counter,_products['LinkImmagine'], totalCount);
                      }
                      ),
                    ],
                  ),
                  Row(
                    children:<Widget>[
                      Expanded(child: MaterialButton(onPressed: (){},
                        color: Colors.white,
                        textColor: Colors.grey,
                        child: Row(
                          children:<Widget>[
                            Expanded(child: Text("Se non sei sicuro che sia quello che cerchi, clicca qui!")),
                            Expanded(child: ListTile(
                              contentPadding: EdgeInsets.all(10.0),
                              title: Icon(Icons.help_outlined, color: Colors.blueAccent,),
                              onTap: () => _launchURL('calpedel@gmail.com', 'Richiesta informazioni prodotto', 'Vorrei sapere se \n ${_products['CodiceCalp']} è compatibile con il modello in etichetta \n % inserire qui sotto%'),
                            ),//
                            ) // or airline_seat_recline_normal_rounded
                          ],
                        ),
                      )
                      )
                    ],
                  ),
                ])
            ),
        );

  }
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

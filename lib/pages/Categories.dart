import 'package:flutter/material.dart';
import 'package:calpedelapp/components/categories.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Categories());
}

class Categories extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {CatDetails.routeName: (context) => CatDetails()},

        home: Cat()
    );
  }
}

class Cat extends StatefulWidget {
  CatState createState() => CatState();
}

class CatState extends State<Cat> {
  List categories = [];

  void updateProducts(String search) {
    searchProducts(search).then((netSF1) => setState(() => categories = netSF1));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          //backgroundImage: Image.file('calpedel.jpg'),
          backgroundColor: Colors.indigo,
          title: Text('Componenti'),
//      actions: <Widget>[
//        new IconButton(icon: Icon(Icons.search, color: Colors.white60,), onPressed: (){})
//      ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // Occupa tutta la colonna rimanente
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      // Element of the scrolling widget
                        contentPadding: EdgeInsets.all(10.0),
                        title: Text(categories[index]["Raccolta"],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        trailing: Image.network(
                          categories[index]["LinkImmagine"],
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                        onTap: () => {
                          Navigator.pushNamed(context, CatDetails.routeName,
                              arguments:
                              ProductsArguments(categories[index]['CodiceCalp']))
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

class CatDetails extends StatefulWidget {
  static const routeName = "/calpedelapp";
  CatDetailsState createState() => CatDetailsState();
}

class CatDetailsState extends State<CatDetails> {
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
    if (_first) {
      _first = false;
      final ProductsArguments args = ModalRoute.of(context).settings.arguments;
      findProducts(args.ProdId).then((products) => setState(() {
        _products = products;
      }));
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
                //      new Text("${_products['CodiceCalp']}",
                //          style: TextStyle(
                //              fontSize: 20,
                //              fontWeight: FontWeight.w500,
                //              color: Colors.black)),
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
                    IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){}),
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

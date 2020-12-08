import 'package:flutter/material.dart';
import 'package:calpedelapp/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:calpedelapp/components/Card block.dart';

void main() => runApp(BloC());

class BloC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
      create: (_) => CartBloc(),
      child: MaterialApp(
          title: 'Ricerca',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Ricerca'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                            Icons.shopping_cart,
                            color: Colors.white,
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
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return GestureDetector(
                onTap: () {
                  bloc.addToCart('calpedel',3, 'http://www.calpedel.it//images//lav//TP0AE00.JPG',index, index);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/${index + 1}.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}


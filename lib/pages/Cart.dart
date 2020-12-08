import 'package:flutter/material.dart';
// my imports
import 'package:calpedelapp/components/cart_prod.dart';
import 'package:calpedelapp/pages/SF.dart';
import 'package:calpedelapp/pages/BloC.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      elevation: 0.0,
      //backgroundImage: Image.file('calpedel.jpg'),
      backgroundColor: Colors.indigo,
      title: Text('Shopping Cart'),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.search, color: Colors.white60,), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new SF()));
        })
      ],
    ),
      body: new Cart_prod(),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Row(
          children:<Widget>[
            Expanded(child: ListTile(
              title: Text("Total:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),),
              subtitle: Text("€15.50"),
            )),
            Expanded(child: new MaterialButton(onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new BloC()));
            },
              child: Text("Check Out", style: TextStyle(color: Colors.white),),
              color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
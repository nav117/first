import 'package:flutter/material.dart';
import 'package:calpedelapp/pages/Cart.dart';

class Cart_prod extends StatefulWidget {
  @override
  _Cart_prodState createState() => _Cart_prodState();
}

class _Cart_prodState extends State<Cart_prod> {
  var Products_on_the_cart =[
  {
  "name": "Penna Touch",
  "Picture": "images/PennaTouch4Funzioni.jpg" ,
  "Quantity": 4,
  "price": 1.60,
  },
  {
  "name": "Penna Touch",
  "Picture": "icon/icon.png" ,
  "Quantity": 4,
  "price": 1.60,
  },{
  "name": "Decalcificante",
  "Picture": "images/Decalc.jpg" ,
  "Quantity": 4,
  "price": 6.71,
  },
  {
  "name": "Lampada Solare",
  "Picture": "images/Lamp.jpg" ,
  "Quantity": 4,
  "price": 1.95,
  },//Group different things
    {
      "name": "Decalcificante",
      "Picture": "images/Decalc.jpg" ,
      "Quantity": 4,
      "price": 6.71,
    },
    {
      "name": "Lampada Solare",
      "Picture": "images/Lamp.jpg" ,
      "Quantity": 4,
      "price": 1.95,
    }//Group different things
  ];
  // ignore: non_constant_identifier_names
  var ProdCurrent =[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index){
           return Single_cart_prod(
             cart_prod_name: Products_on_the_cart[index]["name"],
             cart_prod_quantity: Products_on_the_cart[index]["Quantity"],
             cart_prod_price: Products_on_the_cart[index]["price"],
             cart_prod_pict: Products_on_the_cart[index]["Picture"],
           );
        });
  }
}

class Single_cart_prod extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pict;
  var cart_prod_quantity;
  final cart_prod_price;
  Single_cart_prod({
    this.cart_prod_name,
    this.cart_prod_pict,
    this.cart_prod_quantity,
    this.cart_prod_price
  });
//var cart_prod_quantity=1;
  void decrementCounter(int counter) {
   if (counter > 0) counter--;
  }
  void incrementCounter(int counter) {
    if (counter < 100) counter++;

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_prod_pict, width: 90.0, height: 90.0,),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children:<Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                    child: new Text("Price", style: TextStyle(fontSize: 16.0),)
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("\€$cart_prod_price", style: TextStyle(color: Colors.deepOrange,fontSize: 16.0),)
                ),
                IconButton(icon: Icon(Icons.delete_forever), onPressed: (){}),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                    child: new Text("Quantity", style: TextStyle(fontSize: 16.0),)
                ),
                IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){
                  decrementCounter(cart_prod_quantity.toInt());
                }),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("$cart_prod_quantity", style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),)
                ),
                IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){
                  incrementCounter(cart_prod_quantity.toInt());
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

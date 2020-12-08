//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:calpedelapp/pages/prod_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var prod_list = [
    {
      "name": "Penna Touch",
      "Picture": "images/PennaTouch4Funzioni.jpg" ,
      "Old_price": 3,
      "price": 1.60,
    },
    {
      "name": "Penna Touch",
      "Picture": "icon/icon.png" ,
      "Old_price": 3,
      "price": 1.60,
    },{
      "name": "Decalcificante",
      "Picture": "images/Decalc.jpg" ,
      "Old_price": 10.35,
      "price": 6.71,
    },
    {
      "name": "Lampada Solare",
      "Picture": "images/Lamp.jpg" ,
      "Old_price": 4,
      "price": 1.95,
    }//Group different things
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prod_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ), itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: prod_list[index]['name'],
            prod_old_price: prod_list[index]['Old_price'],
            prod_pict: prod_list[index]['Picture'],
            prod_price: prod_list[index]['price'],
          );
    });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pict;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pict,
    this.prod_old_price,
    this.prod_price
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero1"),
          child: Material(
            child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
              // Here we pass the details of the products to the page prod_details
                builder: (context)=> new ProductDetails(prod_det_name: prod_name, prod_det_price: prod_price, prod_det_old_price: prod_old_price, prod_det_picture: prod_pict,))), //Write {return } or => is the same
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child:  new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("\€$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "\€$prod_old_price", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough),
                      ),
                  ]
              ),
            ),
            child: Image.asset(prod_pict, fit: BoxFit.cover,)),
          ),
          )),
    );
  }
}
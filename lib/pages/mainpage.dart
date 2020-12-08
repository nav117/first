// import 'dart:html';
import 'package:calpedelapp/pages/Shipping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:calpedelapp/pages/NV.dart';
import 'package:calpedelapp/pages/Resi.dart';

import 'package:calpedelapp/components/vertical_listview.dart';
import 'package:calpedelapp/components/Products.dart';
import 'package:calpedelapp/pages/Cart.dart';
import 'package:calpedelapp/pages/SF.dart';
import 'package:calpedelapp/pages/authentication_service.dart';
import 'package:provider/provider.dart';
//import 'package:calpedelapp/pages/SF.dart';

void main() {
  runApp(mainpage());

}

class mainpage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/FiloGiardinaggio_1_6_30.jpg'),
          AssetImage('images/PennaTouch4Funzioni.jpg'),
          AssetImage('images/TermometroDigitaleAlimentiAllarme.jpg'),
          AssetImage('images/SupportoSmartphone.JPG'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.0,
        dotIncreasedColor: Colors.blueAccent,
        indicatorBgPadding: 5.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        //backgroundImage: Image.file('calpedel.jpg'),
        backgroundColor: Colors.indigo,
        title: Text('Calpedel APP'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white60,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => new SF()));
              }),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white60,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//        header
            new UserAccountsDrawerHeader(
              accountName: Text('Mirko'),
              accountEmail: Text('mirko4598@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white60,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blueAccent),
            ),

//  This is the body of the left page

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home_outlined),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Code zone'),
                leading: Icon(Icons.dehaze_rounded),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Photo zone'),
                leading: Icon(Icons.photo_camera_rounded),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Chi siamo?'),
                leading: Icon(Icons.help, color: Colors.lightBlue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Shipping()));
              },
              child: ListTile(
                title: Text('Spedizioni'),
                leading: Icon(Icons.local_shipping_sharp, color: Colors.yellow[600],),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new NV()));
              },
              child: ListTile(
                title: Text('Norme di vendita'),
                leading: Icon(Icons.article, color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Resi()));
              },
              child: ListTile(
                title: Text('Garanzie e resi'),
                leading: Icon(CupertinoIcons.briefcase, color: Colors.green,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.account_circle, color: Colors.blue[600],),
              ),
            ),

            InkWell(
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
              child: ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.account_circle, color: Colors.blue[600],),
              ),
            ),


          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // The carousel of images
          image_carousel,
          // Padding Widget
          new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              'Prodotti',
              style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),

          // Vertical list of products
          VerticalList(),
          VerticalList2(),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'La nostra soffitta',
              style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic ),
            ),
          ),

          // Block view (as windows mobile for example)
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}

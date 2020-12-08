import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calpedelapp/components/Card block.dart';
import 'package:url_launcher/url_launcher.dart';


class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;
    var calpedel = bloc.cartl;
    var prezzo = bloc.price;
    var k = bloc.HM;
    var photo = bloc.image;
    var list = [];
    var total = prezzo;

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrello"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];
          return ListTile(
            leading: Image.network(photo,
              fit: BoxFit.cover,
            ),
            title: Text(calpedel +'per $k'),
            subtitle: Text('Al prezzo totale di $prezzo' + '€'),
            trailing: RaisedButton(
              child: Text('Clear'),
              color: Theme.of(context).buttonColor,
              elevation: 1.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                bloc.clear(giftIndex);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Row(
          children:<Widget>[
            Expanded(child: ListTile(
              title: Text("Totale:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),),
              subtitle: Text(' $total'),
            )),
            Expanded(child: new MaterialButton(onPressed: (){
              _launchURL('calpedel@gmail.com', 'Richiesta ordine prodotto', 'Vorrei sapere se è '
                  'possibile ordinare i seguenti prodotti\n $calpedel al prezzo totale di $total \n %Firma con codice cliente%');
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


    _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

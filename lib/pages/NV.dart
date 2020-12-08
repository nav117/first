import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// my imports

import 'package:calpedelapp/pages/Cart.dart';
import 'package:calpedelapp/pages/SF.dart';
import 'package:url_launcher/url_launcher.dart';


class NV extends StatefulWidget {
  @override
  _NVState createState() => _NVState();
}

class _NVState extends State<NV> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        //backgroundImage: Image.file('calpedel.jpg'),
        backgroundColor: Colors.indigo,
        title: Text('Norme di vendita'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white60,), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new SF()));
          }),
          new IconButton(icon: Icon(Icons.shopping_cart_rounded, color: Colors.white60,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          })
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          new Row(
            children: <Widget>[
              Icon(Icons.perm_contact_calendar_outlined, color: Colors.lightBlue, size: 36.0),
              Text("Chi può ordinare?",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Divider(color: Colors.white70,),
              Text("Tutti possono ordinare: privati, professionisti od aziende senza minimi di ordine."
                  , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Per acquistare non e' necessario essere in possesso di Partita IVA.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("I prezzi sono quelli indicati sui cataloghi; prezzi di favore "
                  "possono essere concordati, solo ed esclusivamente per iscritto, in caso di quantità particolari."
                  , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Tutti i prezzi sono in Euro e comprensivi di IVA secondo le disposizioni vigenti.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
            ],
          ),
          new Row(
            children: <Widget>[
              Icon(Icons.local_grocery_store, color: Colors.lightBlue, size: 36.0),
              Text("Come ordinare?",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Divider(color: Colors.white70,),
              Text("Inviare gli ordini cliccando su check-out nel carrello o via e-mail, specificando per ogni articolo ordinato il catalogo di appartenenza, il relativo codice ed il prezzo unitario:"
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Row(
                children: <Widget>[
                  Text("Non conosci il codice? Clicca qui!",
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  IconButton(icon:Icon(Icons.info_outline, color: Colors.lightBlue, size: 36.0),
                      onPressed: () => _launchURL('calpedel@tiscali.it', 'Richiesta informazioni', 'Buonasera, \n Vorrei avere informazioni rigurdo il seguente articolo:-- apprtenente al catalogo: -- '
                      'e sapere eventualmente anche la compaatibilità con il mio prodotto: \n "inserire qui sotto il nome del suo prodotto e foto dell''apprecchio"'),
                        ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Sai già il codice e sei nostro cliente?",
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  IconButton(icon:Icon(Icons.mail_outline, color: Colors.lightBlue, size: 36.0),
                    onPressed: () => _launchURL('calpedel@tiscali.it', 'Ordine', 'Salve, \n'
                        'Mi chiamo (“—“, Nome, Cognome, “Inserire codice cliente”) e vorrei ordinare l’articolo … presente nel catalogo …'
                        'L’indirizzo di fatturazione è il seguente:\n'
                        '\n'
                        'Recapito telefonico:'
                        '\n'
                        'Modalità di pagamento:'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Non sei ancora nostro cliente?",
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  IconButton(icon:Icon(Icons.mail_outline, color: Colors.lightBlue, size: 36.0),
                    onPressed: () => _launchURL('calpedel@tiscali.it', 'Ordine', 'Salve, \n'
                        'Mi chiamo (“—“, Nome, Cognome, “Codice fiscale” (ragione sociale in caso di ditta) ) e vorrei ordinare l’articolo … presente nel catalogo … '
                        'L’indirizzo di fatturazione è il seguente:\n'
                        '\n'
                        'Recapito telefonico:'
                        '\n'
                        'Modalità di pagamento:'),
                  ),
                ],
              ),
              //all'indirizzo calpedel@tiscali.it
              Divider(color: Colors.white70,),
              Text("Ai sensi dell'art. 10 della legge 31/12/96 n.675 ed in relazione ai dati personali "
                  "che formeranno oggetto di trattamento, Calpedel.it garantisce che i dati inviati "
                  "non saranno divulgati a terzi.", style: TextStyle(fontSize: 15.0, color: Colors.black, fontStyle: FontStyle.italic),),
              Divider(color: Colors.white70,),
              Text("Ad ogni ordine ricevuto seguirà via posta elettronica una conferma della ricezione "
                  "dell'ordine, con eventuali note indicanti eventuali indisponibilità di articoli. "
                  "In caso di indisponibilità parziale del materiale ordinato, verrà richiesto se "
                  "si preferisce ricevere il materiale in più spedizioni, od attendere la "
                  "disponibilità completa del materiale ordinato, o annullare l'ordine."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
            ],
          ),


          // new Text("It is possible to choose between 3 different shipping way.", style: TextStyle(fontSize: 20.0, color: Colors.black),),
          // Text("Standard shipping method is the standard one with mark. Shipping fees will be charged on the invoice", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),),
        ],
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


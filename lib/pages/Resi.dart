import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// my imports

import 'package:calpedelapp/pages/Cart.dart';
import 'package:calpedelapp/pages/SF.dart';

class Resi extends StatefulWidget {
  @override
  _ResiState createState() => _ResiState();
}

class _ResiState extends State<Resi> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        //backgroundImage: Image.file('calpedel.jpg'),
        backgroundColor: Colors.indigo,
        title: Text('Politica dei Resi'),
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
              Icon(CupertinoIcons.doc_plaintext, color: Colors.lightBlue, size: 36.0),
              Text("Diritto di recesso",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Divider(color: Colors.white70,),
              Text("Il cliente può esercitare il diritto di recesso entro il decimo giorno dal ricevimento del materiale.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Il diritto di recesso è esercitabile su tutti i prodotti eccetto i prodotti SW, dove si applica solo se ancora sigillati. ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Il prodotto deve essere restituito integro, nell'imballo originale, in condizioni da poter essere rimesso in vendita; "
                  "non e' possibile usufruire del diritto di recesso per prodotti a cui siano stati rimossi i sigilli o ricambi e componenti di cui sia stato tentato l'utilizzo."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
            ],
          ),
          new Row(
            children: <Widget>[
              Icon(Icons.receipt_long, color: Colors.green, size: 36.0),
              Text("Garanzie:",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Divider(color: Colors.white70,),
              Text("La garanzia minima su tutti i prodotti è di mesi 6. Per molti prodotti la garanzia offerta è maggiore; ulteriori eventuali dettagli sono nei cataloghi specifici.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Per ricambi e componentistica, la garanzia è limitata ai casi di evidente difettosità del prodotto.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Per molti articoli l'assistenza in garanzia è esercitata direttamente dal produttore."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Non sono garantiti i danni diretti o indiretti provocati da cattivo od improprio uso; per i prodotti di informatica HW, non sono garantiti malfunzionamenti dovuti ad applicativi o incompatibilità SW."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Se il difetto dichiarato non risultasse riproducibile, verranno addebitati € 30.00 alla restituzione del prodotto."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),

            ],
          ),
          new Row(
            children: <Widget>[
              Icon(Icons.swap_calls_outlined, color: Colors.red, size: 36.0),
              Text("Restituzione:",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Divider(color: Colors.white70,),
              Text("Per restituire i prodotti, occorre chiedere via e-mail il numero di autorizzazione al reso, e concordare i termini di accredito o sostituzione.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("I prodotti devono essere restituiti integri, nel loro imballo originale "
    "e con adeguato imballo esterno; i documenti di spedizione (o l'etichetta sull'imballo esterno) dovranno riportare il numero di autorizzazione al reso.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("La spedizione del materiale verso la Calpedel è a cura ed a carico del cliente."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("I prodotti inviati alla Calpedel privi dei requisiti di cui sopra saranno respinti e rinviati al mittente in porto assegnato."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
              Text("Le spese di spedizione per la restituzione del materiale sono, a meno di diverso accordo scritto tra le parti, a carico del cliente."
                , style: TextStyle(fontSize: 17.0, color: Colors.black),),
              Divider(color: Colors.white70,),
       ],
          ),
          new Row(
            children: <Widget>[
              Icon(CupertinoIcons.person_2_alt, color: Colors.blueAccent, size: 36.0),
              Text("Competenza:",
                style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Divider(color: Colors.white70,),
          Text("Per ogni controversia il foro competente è quello di Milano."
            , style: TextStyle(fontSize: 17.0, color: Colors.black),),
          Divider(color: Colors.white70,),
        ],
      ),
    );
  }
}

class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Text('Nel caso si desideri acquistare pagando anticipatamente, la procedura di acquisto è:', style: TextStyle(fontSize: 17.0, color: Colors.black),),
        new ListTile(
            leading: new MyBullet(),
            title: new Text("Inviare l'ordine come descritto precedentemente, evidenziando la modalita' di spedizione e pagamento prescelta.", style: TextStyle(fontSize: 17.0, color: Colors.black),)
        ),
        new ListTile(
          leading: new MyBullet(),
          title: new Text("Attendere conferma della ricezione dell'ordine e successiva (o contestuale), informazione sulla disponibilità del materiale ordinato e dell''importo da corrispondere.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
        ),
        new ListTile(
            leading: new MyBullet(),
            title: new Text("Effettuare il pagamento utilizzando gli estremi ricevuti alla conferma dell'ordine secondo quanto riportato nel successivo paragrafo Pagamenti.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => new Shipping()));
            }
        ),
        new ListTile(
          leading: new MyBullet(),
          title: new Text('Il materiale verrà spedito appena il pagamento sarà visibile (immediatamente per ricarica Postepay, 3-5 giorni negli altri casi).', style: TextStyle(fontSize: 17.0, color: Colors.black),),
        ),
      ],
    );
  }
}
class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 20.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
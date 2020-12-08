import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// my imports

import 'package:calpedelapp/pages/Cart.dart';
import 'package:calpedelapp/pages/SF.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      elevation: 0.0,
      //backgroundImage: Image.file('calpedel.jpg'),
      backgroundColor: Colors.indigo,
      title: Text('Spedizioni'),
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
              Column(
                children: <Widget>[
                  Divider(color: Colors.white70,),
                  Text("E' possibile scegliere tra tre diverse modalità di spedizione: standard, super-veloce e prioritaria.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text("Quando non richiesto diversamente, le spedizioni vengono effettuate con modalità standard in contrassegno.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text("Le spese di imballo e trasporto, ove presenti, verranno addebitate in fattura."
                    , style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text("Caratteristiche, spese e limitazioni sono nella tabella riassuntiva riportata di seguito.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  new InteractiveViewer(
                      constrained: true,
                      scaleEnabled: true,
                      child: new Image(image: AssetImage('images/ShippingRules.png'),)
                    //  height: 250.0,
                    //  width: 250.0,
                      ),
                  Divider(color: Colors.white70,),

                ],
              ),
              new Row(
                children: <Widget>[
                  Icon(Icons.access_time_rounded, color: Colors.lightBlue, size: 36.0),
                  Text(" Desideri pagare\n anticipatamente?",
                    style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              MyList(),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.lightBlueAccent, Colors.blueAccent],
                    stops: <double>[0.0, 1.0],
                  ),
                ),
                height: 100.0,
               // color: Colors.blue[700],
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text("Standard", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new CupertinoAlertDialog(
                    title: Text("Ha impostato la modalità standard come predefinita, va bene?"),
                    actions: [
                      FlatButton(onPressed: () => Navigator.pop(context, false),
                          child: Text("Yes")),
                      FlatButton(onPressed: () => Navigator.pop(context, false),
                          child: Text("No")),
                    ],
                  )
                  ));
                  }
                ),
                // Text("Standard", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.lightGreenAccent, Colors.blueAccent],
                    stops: <double>[0.0, 1.0],
                  ),
                ),
                height: 100.0,
                //color: Colors.blue[600],
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text("Super-veloce", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new CupertinoAlertDialog(
                        title: Text("Ha impostato la modalità Super-veloce come predefinita, va bene?"),
                        actions: [
                          FlatButton(onPressed: () => Navigator.pop(context, false),
                              child: Text("Yes")),
                          FlatButton(onPressed: () => Navigator.pop(context, false),
                              child: Text("No")),
                        ],
                      )
                      ));
                    }
                ),
                //Text("Super-veloce:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
              ),
     //         Container(
     //           height: 100.0,
     //           decoration: BoxDecoration(
     //             gradient: LinearGradient(
     //               begin: Alignment.topCenter,
     //               end: Alignment.bottomCenter,
     //               colors: <Color>[Colors.lightBlueAccent, Colors.blueAccent],
     //               stops: <double>[0.0, 1.0],
     //             ),
     //           ),
//                color: Colors.blue,
     //           child: ListTile(
     //             contentPadding: EdgeInsets.all(10.0),
     //             title: Text("Prioritaria", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
    //             onTap: () {
    //                Navigator.push(context, MaterialPageRoute(builder: (context) => new Shipping()));
    //              }
    //            ),
                // Text("Prioritaria", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40.0, color: Colors.white,),),
    //          ),
              Text("La comunicazione sulla disponibilità del materiale è solo informativa, rappresenta lo stato nel momento della richiesta, e non costituisce impegno da parte di Calpedel.it. "),
              Text("Se non fosse possibile ottenere la disponibilità del materiale entro 15 giorni dalla ricezione del pagamento, verrà proposto al Cliente di scegliere tra il rimborso di quanto pagato e l'accredito di questa cifra per altri acquisti."),
              new Row(
                children: <Widget>[
                  Icon(Icons.euro_outlined, color: Colors.lightBlue, size: 36.0),
                  Text("Modalità di pagamento",
                    style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Divider(color: Colors.white70,),
                  Text("Modalità di pagamento accettate:"
                    , style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  Row(
                    children: <Widget>[
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[Colors.orange, Colors.amber],
                            stops: <double>[0.0, 1.0],
                          ),
                        ),
                        height: 90.0,
                        //width: 170.0,
                        //color: Colors.blue[600],
                        child: ListTile(
                            contentPadding: EdgeInsets.all(10.0),
                            title: Text("Pagamento anticipato", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.white,),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new CupertinoAlertDialog(
                                title: Text("Ha impostato la modalità Pagamento anticipato come predefinita, va bene?"),
                                actions: [
                                  FlatButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new CupertinoAlertDialog(
                                    title: Text("Che modalità preferisce usare?"),
                                    actions: [
                                      FlatButton(onPressed: () => Navigator.pop(context, false),
                                          child: Text("PostePay")),
                                      FlatButton(onPressed: () => Navigator.pop(context, false),
                                          child: Text("Bonifico Bancario")),
                                      FlatButton(onPressed: () => Navigator.pop(context, false),
                                          child: Text("Conto Corrente postale")),
                                    ],
                                  )
                                  )
                                  ), child: Text("Yes")),
                                  FlatButton(onPressed: () => Navigator.pop(context, false),
                                      child: Text("No")),
                                ],
                              )
                              )
                              );
                            }
                        ),

                      ),
                      ),
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[Colors.lightBlue, Colors.blue],
                            stops: <double>[0.0, 1.0],
                          ),
                        ),
                        height: 90.0,
                        //width: 170.0,
                        //color: Colors.blue[600],
                        child: ListTile(
                            contentPadding: EdgeInsets.all(10.0),
                            title: Text("Contrassegno a ricevimento merce", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.white,),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new CupertinoAlertDialog(
                                title: Text("Ha impostato la modalità Contrassegno a ricevimento merce come predefinita, va bene?"),
                                actions: [
                                  FlatButton(onPressed: () => Navigator.pop(context, false),
                                      child: Text("Yes")),
                                  FlatButton(onPressed: () => Navigator.pop(context, false),
                                      child: Text("No")),
                                ],
                              )
                              ));
                            }
                        ),

                      ),),



                      //Text("Contrassegno a \nricevimento merce",
                      //  style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                      //),
                    ],
                  ),
                  Divider(color: Colors.white70,),
                  Text("Dopo aver effettuato il pagamento inviare, nel caso di ricarica Postepay, una mail con gli estremi del pagamento "
                      "(importo, data ed ora). Negli altri casi copia della ricevuta tramite mail con allegata la ricevuta acquisita con scanner.", style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text("Attenzione:",
                    style: new TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                  Text("Il materiale verrà spedito appena il pagamento sarà visibile (immediatamente per ricarica Postepay, 3-5 giorni negli altri casi)."
                    , style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text("Per accelerare i tempi, e' fortemente consigliata la modalità con ricarica Postepay.", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black),),
                  Divider(color: Colors.white70,),
                  Text(" PS: per effettuare la ricarica Postepay non e' necessario essere titolare di una carta Postepay od avere un conto Bancoposta.", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.italic),),
                ],
              ),
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
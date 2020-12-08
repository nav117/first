import 'package:flutter/material.dart';
import 'package:calpedelapp/pages/Cart.dart';
import 'package:url_launcher/url_launcher.dart';



//class CallService{  void sendemail(String email)=>launch("mailto:$email"); }

//GetIt locator= GetIt.instance;

//void set(){  locator.registerSingleton<CallService>(CallService());}

class ProductDetails extends StatefulWidget{
  final prod_det_name;
  final prod_det_price;
  final prod_det_old_price;
  final prod_det_picture;

  ProductDetails({
    this.prod_det_name,
    this.prod_det_price,
    this.prod_det_old_price,
    this.prod_det_picture
  });
  @override
  _ProdDetState createState() =>_ProdDetState();
}


class _ProdDetState extends State<ProductDetails> {
//  final CallService _service = locator<CallService>();
//  TextEditingController _controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        //backgroundImage: Image.file('calpedel.jpg'),
        backgroundColor: Colors.indigo,
        title: Text('Calpedel APP'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white60,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart_rounded, color: Colors.white60,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          }),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 250.0,
            color: Colors.cyan[50],
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.prod_det_picture), //Attention how I passed the picture
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.prod_det_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),),
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text("€ ${widget.prod_det_old_price}", style: TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough),),),
                      Expanded(child: Text("€ ${widget.prod_det_price}", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                      )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children:<Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children:<Widget>[
                    Expanded(child: Text("If you are not sure about the product click here")),
                    Expanded(child: ListTile(
                        contentPadding: EdgeInsets.all(10.0),
                        title: Icon(Icons.help_outlined),
                      onTap: () => _launchURL('calpedel@gmail.com', 'Flutter Email Test', 'Vorrei avere informazioni riguardo \n ${widget.prod_det_name}'),
                    ),//
                    ) // or airline_seat_recline_normal_rounded
                  ],
                ),
              )
              )
            ],
          ),
          Row(
            children:<Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children:<Widget>[
                    Expanded(child: Text("Quantity", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                    )
                    ),
                    Expanded(child: MaterialButton(onPressed: (){
                      showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Quantity"),
                          content: Text("Choose the quantity"),
                          actions: <Widget>[
                            MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: new Text("Close"),)
                          ],
                        );
                      });
                    },
                      color: Colors.white,
//                        textColor: Colors.grey,
                      child: Row(
                        children:<Widget>[
                          Expanded(child: Icon(Icons.arrow_drop_down))
                        ],
                      )
                      ,)
                    ),
                    Expanded(child: MaterialButton(onPressed: (){},
                      color: Colors.white,
//                        textColor: Colors.grey,
                      child: Row(
                        children:<Widget>[
                          Expanded(child: Icon(Icons.shopping_basket_outlined))
                        ],
                      )
                      ,)
                    )
                  ],
                )
                ,)
              )
            ],
          ),
          Row(
            children:<Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.blueAccent,
                textColor: Colors.orange,
                child: Row(
                  children:<Widget>[
                    Expanded(child: Text("Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    Expanded(child: Icon(Icons.help_outlined)) // or airline_seat_recline_normal_rounded
                  ],
                )
                ,)
              ),

            ],
          ),
            ],
          )

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
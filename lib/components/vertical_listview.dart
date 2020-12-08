import 'package:flutter/material.dart';
import 'package:calpedelapp/pages/Categories.dart';

class VerticalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/Products/Components.jpg',
            image_caption: 'Componenti', //Components
          ),
          Category(
            image_location: 'images/Products/TVr.png',
            image_caption: 'Ricambi TV - VCR - Antennistica', //TV Replacement
          ),
          Category(
            image_location: 'images/Products/Telefono.png',
            image_caption: 'Telefonia', //Smartphone replacement
          ),
          Category(
            image_location: 'images/Products/Laptop.png',
            image_caption: 'Informatica', //Computer replacement
          ),
          Category(
            image_location: 'images/Products/Audio.png',
            image_caption: 'Apparecchi / accessori Audio', //Audio replacement
          ),
          Category(
            image_location: 'images/Products/Camera.png',
            image_caption: 'Apparecchi / accessori foto e videocamere', //Camera replacement
          ),

          // new Icon(Icons.settings_input_component_outlined),
          // new Icon(Icons.settings_input_antenna_outlined),
          // new Icon(Icons.computer_rounded),
          // new Icon(Icons.phone),
        ],
      ),
    );
  }
}
class VerticalList2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Category(
            image_location: 'images/Products/elettrodomestici.png',
            image_caption: 'Ricambi elettrodomestici', //Household appliances
          ),
          Category(
            image_location: 'images/Products/Tools.png',
            image_caption: 'Tools',
          ),
          Category(
            image_location: 'images/Products/Cables.png',
            image_caption: 'Cavi, connettori, adattatori', //Cables
          ),
          Category(
            image_location: 'images/Products/Alarm system.png',
            image_caption: 'Sistemi di allarme', //Alarm System
          ),
          Category(
            image_location: 'images/Products/Stationery.png',
            image_caption: 'Cancelleria', // Stationery
          ),
          Category(
            image_location: 'images/Products/Bike.png',
            image_caption: 'Ricambi per bicicletta',
          ),
          // new Icon(Icons.settings_input_component_outlined),
          // new Icon(Icons.settings_input_antenna_outlined),
          // new Icon(Icons.computer_rounded),
          // new Icon(Icons.phone),
        ],
      ),
    );
  }
}


class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => new Categories()));
    },
      child: Container( // When we have this widget we must use them
        width: 120.0,
        child: ListTile(
          title: Image.asset(image_location,
          width: 120.0,
          height: 85.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
          ) ,
        ),
      ),
    ),);
  }
}
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calpedelapp/components/UserImagePicker.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String string = "TextRecognition";
  File _userImageFile;
  List<ImageLabel> _imageLabels = [];
  List<Barcode> _barCode = [];
  var result = "";

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  //image_label_recognition
  processImageLabels() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    ImageLabeler labeler = FirebaseVision.instance.imageLabeler();
    _imageLabels = await labeler.processImage(myImage);
    result = "";
    for (ImageLabel imageLabel in _imageLabels) {
      setState(() {
        result = result +
            imageLabel.text +
            ":" +
            imageLabel.confidence.toString() +
            "\n";
      });
    }
  }

//recognise_Text
  recogniseText() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(myImage);
    result = "";
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        setState(() {
          result = result + ' ' + line.text + '\n';
        }
        );
      }
    }
  }

//barCode_Scanner
  barCodeScanner() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(_userImageFile);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    _barCode = await barcodeDetector.detectInImage(myImage);
    result = "";
    for (Barcode barcode in _barCode) {
      setState(() {
        result = barcode.displayValue;
      });
    }
  }

//drawer_Item
  Widget drawerItem(String title, IconData iconData, String _string) {
    return InkWell(
      onTap: () {
        setState(() {
          string = _string;
        });
        Navigator.of(context).pop();
      },
      child: Column(
        children: [
          ListTile(
            leading: Icon(iconData),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.network(
                    "https://1.bp.blogspot.com/-B3K1G5D9sPQ/WvDZJGvkqVI/AAAAAAAAFSc/zx6VYIc0IXQmB8oR4c0i7SKjSNL-2xiTQCLcBGAs/s1600/ml-kit-logo.png"),
              ),
              Divider(),
              drawerItem("Text recognition", Icons.title, "TextRecognition"),
              drawerItem("Image labeling", Icons.terrain, "ImageLabeling"),
              drawerItem("Barcode scanning", Icons.workspaces_outline,
                  "BarcodeScanning"),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(string),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              onPressed: () {
                if (string == "TextRecognition") recogniseText();
                if (string == "BarcodeScanning") barCodeScanner();
                if (string == "ImageLabeling") processImageLabels();
              },
              icon: Icon(Icons.check),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                UserImagePicker(_pickedImage),
                Padding(
                    padding: const EdgeInsets.all(16.0), child: SelectableText(result)),
              ],
            ),
          ),
        ));
  }
}
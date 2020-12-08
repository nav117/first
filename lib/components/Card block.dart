import 'package:flutter/material.dart';



// Cart block
class CartBloc with ChangeNotifier {
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;
  //Map<String, String> _cartl = {};

  //Map<String, String> get cartl => _cartl;
  String cartl;
  String price;
  String image;
  int HM;


  //Se c'è un problema sicuro è qui
  //If we have some problem, surely thee is the problem

  void addToCart(s, prezzo, count, im, index) {
    cartl = s;
    price = prezzo;
    HM = count;
    image = im;
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }


  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}

class ProductModel{
  //String image;
  String name;
  //int price;
  int count;

  ProductModel(String name, int price){
    this.name = name;
    //this.price = price;
    //this.image = image;
    this.count = count;
  }
}
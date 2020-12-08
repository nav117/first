import 'dart:convert';
import 'package:http/http.dart' as http;

  final endpoint = 'http://www.calpedel.it/ProvaApp.php';

searchProducts(String text) async {
  if (text == "") return [];

  var response = await http.get(endpoint + "?Categories=y" + text);
  var responseJson = json.decode(response.body);
  if (responseJson['Search'] != null) {
    return responseJson['Search']
        .where((products) => products['Catalogo'] != "N/A")
        .toList();
  }

  return [];
}

findProducts(String id) async {
  if (id == "") {
    return [];
  }
  var response = await http.get(endpoint + "? Item=" + id);
  return json.decode(response.body);
}

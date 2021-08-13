import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';
//import 'package:shopping_app/models/product.dart';

Future<List<Product>> fetchAllProducts(String host, String port) async {
  final String apiUrl = "http://$host:$port/products/api/getAll/";
  var url = Uri.parse(apiUrl);

  var apiProductsResponse = await http.get(url);

  var apiProducts = jsonDecode(apiProductsResponse.body);

  List<Product> productsList = [];
  for (var apiProduct in apiProducts) {
    productsList.add(Product.loadApiProduct(apiProduct));
  }
  return productsList;
}

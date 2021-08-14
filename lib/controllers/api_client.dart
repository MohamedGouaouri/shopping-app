import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';
//import 'package:shopping_app/models/product.dart';

Future<List<Product>> fetchAllProducts(String host, int port) async {
  final String apiUrl = "http://$host:$port/products/api/getAll/";
  var url = Uri.parse(apiUrl);

  var apiProductsResponse = await http.get(url);

  List apiProducts = jsonDecode(apiProductsResponse.body);

  List<Product> productsList = [];
  var product;
  for (var i = 0; i < apiProducts.length; i++) {
    product = Product(
        id: apiProducts[i]['id'],
        name: apiProducts[i]['title'],
        price: apiProducts[i]['price'],
        rate: apiProducts[i]['rating'] != null ? apiProducts[i]['rating'] : 0,
        description: apiProducts[i]['description'],
        number: apiProducts[i]['quantity'],
        pathToimage: apiProducts[i]['image_url']);

    productsList.add(product);
  }

  return productsList;
}

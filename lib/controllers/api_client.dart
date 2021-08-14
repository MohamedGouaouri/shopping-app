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

Future<List<Product>> fetchCartProducts(
    int cartId, String host, int port) async {
  final String endpointUrl = "http://$host:$port/products/api/getCart/$cartId";
  var url = Uri.parse(endpointUrl);

  var apiCartProductsResponse = await http.get(url);

  List apiCartProducts = jsonDecode(apiCartProductsResponse.body);
  List<Product> productsList = [];
  var product;
  for (var i = 0; i < apiCartProducts.length; i++) {
    product = Product(
        id: apiCartProducts[i]['id'],
        name: apiCartProducts[i]['title'],
        price: apiCartProducts[i]['price'],
        rate: apiCartProducts[i]['rating'] != null
            ? apiCartProducts[i]['rating']
            : 0,
        description: apiCartProducts[i]['description'],
        number: apiCartProducts[i]['quantity'],
        pathToimage: apiCartProducts[i]['image_url']);

    productsList.add(product);
  }

  return productsList;
}

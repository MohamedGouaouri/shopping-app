import 'package:flutter/material.dart';

import 'views/products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductsHome(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

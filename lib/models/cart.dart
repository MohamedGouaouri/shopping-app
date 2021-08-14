import 'package:shopping_app/models/product.dart';

class Cart {
  List<Product> products;
  Cart({required this.products});

  addProduct(Product p) {
    products.add(p);
  }
}

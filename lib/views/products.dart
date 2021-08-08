import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/views/cart.dart';
import 'package:shopping_app/views/product_details.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  _ProductsHomeState createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  int _currentNavigationIndex = 0;

  // Dummy data for UI testing, it will replaced by the data
  // fetched from the API
  List<Product> products = [
    Product(
        id: 1,
        name: "A",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "B",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "C",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "D",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "E",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "F",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "G",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "G",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
    Product(
        id: 1,
        name: "G",
        price: 200.0,
        description: "AAAAAAA",
        rate: 4.4,
        number: 1),
  ];

  /// Show user's cart
  _showCart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
  }

  // Show product details by passing the product object

  _showDetails(Product p) {
    print(p.name);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ProductDetailsPage(p)));
  }

  List<Widget> _buildProductListItem() {
    List<Widget> productItems = [];
    for (var p in products) {
      productItems.add(
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: ListTile(
            leading: Text("Item icon"),
            title: Text(p.name),
            subtitle: Text("\$${p.price}"),
            //isThreeLine: true,
            onTap: () => _showDetails(p),
          ),
        ),
      );
    }
    return productItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showCart,
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView(
          padding: EdgeInsets.all(10), children: _buildProductListItem()),

      // This is just fun it must not be implemented
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavigationIndex,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart_rounded),
          )
        ],
        onTap: (idx) {
          if (idx != _currentNavigationIndex) {
            setState(() {
              _currentNavigationIndex = idx;
            });
          }
        },
      ),
    );
  }
}

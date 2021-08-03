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
  // Dummy data for UI testing
  List<Product> products = [
    Product(id: 1, name: "A", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "B", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "C", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "D", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "E", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "F", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "G", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "G", price: 200.0, description: "AAAAAAA"),
    Product(id: 1, name: "G", price: 200.0, description: "AAAAAAA"),
  ];

  // todo: Implement showCart
  _showCart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
  }

  // Todo: Implement onClickProduct
  // Show product details

  _showDetails() {
    print("Show detaills");
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ProductDetailsPage()));
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
              onTap: _showDetails,
              trailing: IconButton(
                // add to cart
                onPressed: () {},
                icon: Icon(Icons.add),
              )),
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
    );
  }
}

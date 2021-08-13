import 'package:flutter/material.dart';
import 'package:shopping_app/controllers/api_client.dart';
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

  Future<List<Product>> _fetchProducts() async {
    List<Product> products = await fetchAllProducts("192.168.1.36", "8000");
    print(products.length);
    return products;
  }

  // List<Widget> _buildProductListItem() {
  //   List<Widget> productItems = [];
  //   for (var p in products) {
  //     productItems.add(
  //       Container(
  //         margin: EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3),
  //               )
  //             ]),
  //         child: ListTile(
  //           leading: Text("Item icon"),
  //           title: Text(p.name),
  //           subtitle: Text("\$${p.price}"),
  //           //isThreeLine: true,
  //           onTap: () => _showDetails(p),
  //         ),
  //       ),
  //     );
  //   }
  //   return productItems;
  // }

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
      body: FutureBuilder(
          future: _fetchProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var p = snapshot.data;
                  return Container(
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
                  );
                });
          }),

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

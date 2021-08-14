import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/views/cart.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  ProductDetailsPage(this.product, {Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // the same as show cart in the home screen
  _showCart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            // add to cart
            onPressed: _showCart,
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Product image
          // TODO: Raplace it with Image.network(${widget.product.imagePath})
          Image.network(widget.product.pathToimage!, height: 300),

          // Product description
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  // row cotaining product  price and rate
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.product.rate}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    widget.product.description,
                  ),
                )
              ],
            ),
          ),

          // Add to cart button
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 60.0,
            width: double.infinity,
            //color: Theme.of(context).primaryColor,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Add to cart",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

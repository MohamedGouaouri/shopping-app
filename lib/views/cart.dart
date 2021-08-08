import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // these data need to be fetched from  the API that I will design
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
  ];

  _buildCartProductsItem(double _width) {
    List<Widget> widgets = [];
    for (var p in products) {
      widgets.add(
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
          child: Row(
            children: [
              Container(
                width: _width / 6,
                child: IconButton(
                  onPressed: () {
                    // TODO: Remove using the
                    setState(() {
                      products.removeAt(products.indexOf(p));
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              ),
              Container(
                width: 2 * _width / 3,
                child: ListTile(
                  leading: Text("Image"),
                  title: Text(p.name),
                  subtitle: Text("\$${p.price}"),
                ),
              ),
              Container(
                width: _width / 6,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          p.number = p.number + 1;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                    Text("${p.number}"),
                    IconButton(
                        onPressed: () {
                          if (p.number >= 1) {
                            setState(() {
                              p.number = p.number - 1;
                            });
                          }
                        },
                        icon: Icon(Icons.remove))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.payment,
            ),
          )
        ],
      ),
      body: products.length != 0
          ? ListView(children: _buildCartProductsItem(_width))
          : Center(
              child: Text("Your cart is empty"),
            ),
    );
  }
}

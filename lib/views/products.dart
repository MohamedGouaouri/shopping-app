import 'package:flutter/material.dart';
import 'package:shopping_app/views/cart.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  _ProductsHomeState createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  _addToCart() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
  }

  _onClickProduct() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addToCart,
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
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
              title: Text("Iot Device"),
              subtitle: Text("\$200"),
              isThreeLine: true,
              onTap: () => _onClickProduct,
            ),
          ),
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
              title: Text("Iot Device"),
              subtitle: Text("\$200"),
              isThreeLine: true,
              onTap: () => _onClickProduct,
            ),
          ),
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
              title: Text("Iot Device"),
              subtitle: Text("\$200"),
              isThreeLine: true,
              onTap: () => _onClickProduct,
            ),
          ),
        ],
      ),
    );
  }
}

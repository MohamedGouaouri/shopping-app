import 'package:flutter/material.dart';
import 'package:shopping_app/controllers/api_client.dart';

import 'package:shopping_app/models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // these data need to be fetched from  the API that I will design

  Future<List<Product>> _fetchCartProducts(int cartId) async {
    return fetchCartProducts(cartId, "127.0.0.1", 8000);
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
        body: FutureBuilder(
            // cart id is replaced by the id assigned to user's cart
            future: _fetchCartProducts(1),
            builder: (BuildContext contest, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var p = snapshot.data[index];
                    return Container(
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                          Container(
                            width: 2 * _width / 3,
                            child: ListTile(
                              leading: Image.network(
                                p.pathToimage,
                                height: 100,
                                width: 100,
                              ),
                              title: Text(p.name),
                              subtitle: Text("\$${p.price}"),
                            ),
                          ),
                          Container(
                            width: _width / 6,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                  ),
                                ),
                                Text("0"),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }));
  }
}

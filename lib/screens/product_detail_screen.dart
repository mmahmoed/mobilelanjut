import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${product.title}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Consumer<Cart>(builder: (context, value, child) {
            return Cadge(
              value: value.jumlah.toString(),
              key: null,
              color: Colors.amber,
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                  );
                },
              ),
            );
          })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10)),
              Text(
                "${product.title}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [Padding(padding: const EdgeInsets.all(10))],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10)),
              Text(
                'in Stock',
                maxLines: 1,
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10)),
              Text(
                "\Rp.${product.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10)),
              Text(
                "Quantity *",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 150.0)),
                  IconButton(
                    icon: Icon(Icons.remove_circle_rounded),
                    onPressed: () {},
                    iconSize: 20,
                  ),
                  Padding(padding: const EdgeInsets.all(1)),
                  Text(
                    "1",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_rounded),
                    onPressed: () {},
                    iconSize: 20,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 130,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("Total : \$${cartData.totalHarga}"),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 60,
                    color: Color.fromARGB(255, 250, 0, 75),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 250.0)),
                        OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Berhasil ditambahkan"),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                            cart.addCart(
                                product.id, product.title, product.price);
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

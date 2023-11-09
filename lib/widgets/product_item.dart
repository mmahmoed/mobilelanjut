import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../providers/cart.dart';

import '../screens/product_detail_screen.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    // final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Image.network(
                    productData.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(productData.title!,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Padding(padding: const EdgeInsets.all(30))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'in Stock',
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: const EdgeInsets.all(10))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "\Rp.${productData.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

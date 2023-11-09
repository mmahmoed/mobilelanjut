import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    final allproduct = productData.allproducts;
    return ListView.builder(
      itemCount: allproduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: ((context) => allproduct[i]), child: ProductItem()),
    );

    // return GridView.builder(
    //   padding: const EdgeInsets.all(80.0),
    //   itemCount: allproduct.length,
    //   itemBuilder: (ctx, i) => ChangeNotifierProvider(
    //     create: ((context) => allproduct[i]),
    //     child: ProductItem(
    //         // allproduct[i].id!,
    //         // allproduct[i].title!,
    //         // allproduct[i].imageUrl!,
    //         ),
    //   ),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 1,
    //     childAspectRatio: 3 / 2,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    // );
  }
}

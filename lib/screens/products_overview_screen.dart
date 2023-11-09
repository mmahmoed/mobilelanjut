import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      text: 'Category',
    ),
    Tab(
      text: 'All',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.white,
            iconSize: 20,
          ),
          titleSpacing: 6,
          title: Text(
            "New Product",
            style:
                TextStyle(color: Colors.white, letterSpacing: 0, fontSize: 16),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: myTab,
          ),
        ),
        body: ProductGrid(),
      ),
    );
  }
}

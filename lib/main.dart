import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/all_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Products())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'New Product',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
              .copyWith(secondary: Colors.white),
        ),
        home: ProductsOverviewScreen(),
        // home: ScreenSementara(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

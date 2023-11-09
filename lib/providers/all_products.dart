import 'dart:math';
import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Paket Laptop Bisnis ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10000000 + Random().nextInt(50000000).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allproducts {
    return _allproducts;
  }

  Product findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }
}

import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity! * cartItem.price!;
    });
    return total;
  }

  void addCart(String? productId, String? title, double? price) {
    if (_items.containsKey(productId)) {
      //ketika sudah tersedia product id do cart
      _items.update(
        productId!,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity! + 1),
      );
    } else {
      //productId baru
      _items.putIfAbsent(
        productId!,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}

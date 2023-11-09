import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final int? qty;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.qty,
    this.isFavorite = true,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    // ignore: missing_required_param
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      qty: json['qty'],
    );
  }
  void statusFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

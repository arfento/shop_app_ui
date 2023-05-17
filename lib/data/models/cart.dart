import 'dart:convert';

import 'package:shop_app_ui/data/models/product.dart';

class Cart {
  final String id;
  final Product product;

  const Cart({
    required this.id,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] ?? '',
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(id: $id, product: $product)';
}

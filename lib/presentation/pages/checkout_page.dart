// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_app_ui/data/models/cart.dart';
import 'package:shop_app_ui/data/models/product.dart';

class CheckoutPage extends StatefulWidget {
  final Product product;
  final Cart? cart;
  const CheckoutPage({
    Key? key,
    required this.product,
    this.cart,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

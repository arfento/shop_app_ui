// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app_ui/data/models/cart.dart';
import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/button_style.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/data/utils/user_preferences.dart';
import 'package:shop_app_ui/presentation/pages/finished_order_page.dart';

class CheckoutPage extends StatefulWidget {
  final Product product;
  final Cart? cart;
  const CheckoutPage({
    Key? key,
    required this.product,
    this.cart,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() {
    return _CheckoutPageState();
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: secondaryTextColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            'Checkout',
            style: defaultHeader1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: SizedBox(
                  width: 96,
                  height: 96,
                  child: Image.asset(
                    widget.product.imgUrls[1],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image_not_supported_outlined),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTitle,
                    ),
                    Text(
                      widget.product.alias,
                      style: TextStyle(color: secondaryColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.characteristics.join(", "),
                      style: secondarySubTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: 'Recipient\'s name:',
          text2: UserPreferences.getUser(Const.userId)!.name,
          text3: "(Address Recipient)",
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: "Payment Method",
          text2: "COD (Cash On Delivery)",
          text3: "(Only support this payment method)",
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        buildSection(
          text1: 'Delivery Service:',
          text2: 'Shopapp Express',
          text3: '(only support this service)',
        ),
        Divider(height: 1, thickness: 1, color: dividerColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              Text(
                "Total : \$${widget.product.price}",
                style: primaryHeader2,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => makeOrder(context, widget.cart),
                  style: elevatedButtonStyle,
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildSection(
      {required String text1, required String text2, required String text3}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(color: primaryColor),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: primaryBoldText,
                ),
                Text(
                  text3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: secondarySubTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makeOrder(BuildContext context, Cart? cart) async {
    final prefs = await SharedPreferences.getInstance();

    if (cart != null) {
      prefs.remove(cart.id);
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FinishedOrderPage(),
        ));
  }
}

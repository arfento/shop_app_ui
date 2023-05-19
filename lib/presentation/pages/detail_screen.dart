// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shop_app_ui/data/models/cart.dart';
import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/data/utils/cart_preferences.dart';
import 'package:shop_app_ui/data/utils/styles/button_style.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/presentation/pages/cart_page.dart';
import 'package:shop_app_ui/presentation/pages/checkout_page.dart';
import 'package:shop_app_ui/presentation/widgets/favorite_button_widget.dart';
import 'package:uuid/uuid.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  final Cart? cart;
  final String? previousPage;

  const DetailScreen({
    Key? key,
    required this.product,
    this.cart,
    this.previousPage,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: secondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
          tooltip: 'Back',
        ),
        actions: const <Widget>[FavoriteButtonWidget()],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Hero(
              tag: widget.product,
              transitionOnUserGestures: true,
              child: Image.asset(
                widget.product.imgUrls[0],
                fit: BoxFit.cover,
                cacheHeight: kIsWeb ? 360 : null,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: secondaryTextColor,
                  ),
                ],
                color: backGroundColor,
              ),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      widget.product.name,
                      style: defaultHeader1,
                    ),
                    Text(
                      widget.product.name,
                      style: TextStyle(color: secondaryColor),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.product.name,
                      style: TextStyle(color: secondaryTextColor),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            buildProductCharacteristic(
                              icon: Icons.water_drop_outlined,
                              characteristic: widget.product.characteristics[0],
                            ),
                            const SizedBox(width: 12),
                            buildProductCharacteristic(
                              icon: Icons.wb_sunny_outlined,
                              characteristic: widget.product.characteristics[1],
                            ),
                            const SizedBox(width: 12),
                            buildProductCharacteristic(
                              icon: Icons.crop_free_outlined,
                              characteristic: widget.product.characteristics[2],
                            ),
                            const SizedBox(width: 12),
                            buildProductCharacteristic(
                              icon: Icons.thermostat_outlined,
                              iconSize: 40,
                              characteristic: widget.product.characteristics[3],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: addToCart,
                          style: outlinedButtonStyle,
                          child: const Icon(Icons.add_shopping_cart),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.shopping_cart_checkout),
                            label: Text(
                              'Checkout \$${widget.product.price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            style: elevatedButtonStyle,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                backgroundColor: backGroundColor,
                                builder: (context) {
                                  return CheckoutPage(
                                      product: widget.product,
                                      cart: widget.cart);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCharacteristic({
    required IconData icon,
    required String characteristic,
    double? iconSize = 36,
  }) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: dividerColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: iconSize,
            color: secondaryColor,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            characteristic,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  void addToCart() {
    CartPreferences.setCart(
      Cart(
        id: const Uuid().v4(),
        product: widget.product,
      ),
    ).then((value) async {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Successfully added to cart',
          style: snackBarTitle,
        ),
        duration: const Duration(seconds: 3),
        action: widget.previousPage == '_CartPageState'
            ? null
            : SnackBarAction(
                label: "Show Cart",
                onPressed: () {
                  if (!mounted) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
              ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }
}

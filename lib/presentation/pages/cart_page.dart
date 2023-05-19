import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_ui/data/models/cart.dart';
import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/data/utils/cart_preferences.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/button_style.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/presentation/pages/checkout_page.dart';
import 'package:shop_app_ui/presentation/pages/detail_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override // initialize empty cart
  List<Cart> _carts = [];

  @override
  void initState() {
    updateCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
          color: primaryTextColor,
          tooltip: 'Back',
        ),
        title: Text(
          'My Cart',
          style: defaultHeader1,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _carts.isEmpty ? null : () => deleteAllCarts(_carts),
            icon: const Icon(Icons.delete_outline_rounded),
            color: primaryTextColor,
            tooltip: 'Clear Cart',
          )
        ],
        elevation: 0.8,
        titleSpacing: 16,
        toolbarHeight: 64,
        backgroundColor: backGroundColor,
      ),
      body: _carts.isEmpty ? buildEmptyCart() : buildListCart(),
    );
  }

  Widget buildListCart() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _carts.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        Product productItem = _carts[index].product;
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailScreen(
                  product: _carts[index].product,
                  previousPage: runtimeType.toString(),
                );
              },
            )).then((value) => updateCart());
          },
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: dividerColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            _carts[index].product.imgUrls[1],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.image_not_supported_outlined),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productItem.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: defaultTitle,
                          ),
                          Text(
                            productItem.alias,
                            style: TextStyle(color: secondaryColor),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Price: \$${productItem.price}',
                            style: primaryHeader2,
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => deleteSelectedCart(_carts[index]),
                          child: const Text('Delete'),
                          style: outlinedButtonStyle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                builder: (context) {
                                  return CheckoutPage(product: productItem);
                                },
                                backgroundColor: backGroundColor);
                          },
                          style: elevatedButtonStyle,
                          child: const Text(
                            "Checkout",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  Widget buildEmptyCart() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/Unboxing-cuate.svg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Oops, Your cart is still empty!',
              style: defaultHeader2,
            ),
            Text(
              'Your, cart list will appear here.',
              style: TextStyle(color: secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateCart() async {
    final prefs = await SharedPreferences.getInstance();

    final cartKeys = prefs.getKeys().where((key) {
      return key != Const.userId;
    }).toList();

    final newCarts = <Cart>[];

    for (var key in cartKeys) {
      newCarts.add(CartPreferences.getCart(key)!);
    }

    setState(() {
      _carts = newCarts;
    });
  }

  Future<void> deleteSelectedCart(Cart cart) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(cart.id).then((isSuccess) {
      if (isSuccess) {
        updateCart();
        SnackBar snackBar = SnackBar(
          content: Text(
            'Successfully removed from your cart',
            style: snackBarTitle,
          ),
          duration: const Duration(seconds: 3),
        );

        // show snackbar
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    });
  }

  Future<void> deleteAllCarts(List<Cart> carts) async {
    final prefs = await SharedPreferences.getInstance();

    for (var cart in carts) {
      prefs.remove(cart.id).then((isSuccess) {
        if (isSuccess) updateCart();
      });
    }

    SnackBar snackBar = SnackBar(
      content: Text(
        'Successfully clear your cart',
        style: snackBarTitle,
      ),
      duration: const Duration(seconds: 3),
    );

    // show snackbar
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

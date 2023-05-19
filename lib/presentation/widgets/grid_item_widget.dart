// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/presentation/pages/detail_screen.dart';

class GridItemWidget extends StatelessWidget {
  final Product product;
  const GridItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailScreen(product: product);
            },
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Hero(
                  tag: product,
                  transitionOnUserGestures: true,
                  child: Image.asset(
                    product.imgUrls[0],
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image_not_supported_outlined),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(product.name),
                  Text(
                    "\$${product.price}",
                    style: defaultHeader3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

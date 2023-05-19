// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/presentation/widgets/grid_item_widget.dart';

class GridItemsWidget extends StatelessWidget {
  final List<Product> listProduct;
  final EdgeInsetsGeometry padding;
  final int crossAxisCount;
  const GridItemsWidget({
    Key? key,
    required this.listProduct,
    required this.padding,
    required this.crossAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listProduct.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GridItemWidget(product: listProduct[index]);
      },
    );
  }
}

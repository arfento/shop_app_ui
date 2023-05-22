import 'package:flutter/material.dart';
import 'package:shop_app_ui/data/models/product.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/presentation/widgets/grid_item_widget.dart';
import 'package:shop_app_ui/presentation/widgets/grid_items_widget.dart';
import 'package:shop_app_ui/presentation/widgets/search_field_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Product> _productList;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _productList = Const.products;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: <Widget>[
          SearchFieldWidget(text: _query, onChanged: searchProduct),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 768) {
                return GridItemsWidget(
                  listProduct: _productList,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  crossAxisCount: 2,
                );
              } else if (constraints.maxWidth <= 1200) {
                return GridItemsWidget(
                  listProduct: _productList,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  crossAxisCount: 4,
                );
              }

              return GridItemsWidget(
                listProduct: _productList,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                crossAxisCount: 6,
              );
            },
          )
        ],
      ),
    );
  }

  void searchProduct(String value) {
    final products = Const.products.where((element) {
      final nameLower = element.name.toLowerCase();
      final queryLower = value.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      _query = value;
      _productList = products;
    });
  }
}

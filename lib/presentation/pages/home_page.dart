// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_ui/data/models/product.dart';

import 'package:shop_app_ui/data/models/user.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/presentation/pages/detail_screen.dart';
import 'package:shop_app_ui/presentation/widgets/grid_items_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late final CarouselController _bannerCarouselController;
  late final CarouselController _productCarouselController;

  final _productCarousel = Const.products.sublist(0, 8);
  final _productList = Const.products.sublist(8);
  final _bannerUrl = Const.imgBannerUrls;

  late final _username = widget.user.name.split(' ')[0];

  late String _productName;
  late String _productAlias;
  late int _productPrice;

  int _bannerActiveIndex = 0;
  int _productActiveIndex = 0;

  @override
  void initState() {
    super.initState();
    _bannerCarouselController = CarouselController();
    _productCarouselController = CarouselController();

    _productName = _productCarousel[0].name;
    _productAlias = _productCarousel[0].alias;
    _productPrice = _productCarousel[0].price;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 36),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Stack(
          //   alignment: AlignmentDirectional.bottomCenter,
          //   children: [
          //     CarouselSlider.builder(
          //       itemCount: _bannerUrl.length,
          //       itemBuilder: (context, index, realIndex) {
          //         return buildBannerCarousel(_bannerUrl[index], index, size);
          //       },
          //       options: CarouselOptions(
          //         autoPlay: true,
          //         autoPlayAnimationDuration: const Duration(milliseconds: 500),
          //         autoPlayInterval: const Duration(seconds: 5),
          //         height: kIsWeb ? size.height * 0.35 : null,
          //         viewportFraction: kIsWeb ? 0.4 : 1,
          //         enlargeCenterPage: kIsWeb ? true : false,
          //         onPageChanged: (index, reason) {
          //           setState(() {
          //             _bannerActiveIndex = index;
          //           });
          //         },
          //       ),
          //     ),
          //     buildCarouselIndicator(
          //         activeIndex: _bannerActiveIndex,
          //         count: _bannerUrl.length,
          //         controller: _bannerCarouselController),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.only(left: 16),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         'Special For You, $_username.',
          //         style: defaultHeader2,
          //       ),
          //       const Text(
          //         'Choose the product yo want.',
          //         style: TextStyle(fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),
          // CarouselSlider.builder(
          //   carouselController: _productCarouselController,
          //   itemCount: _productCarousel.length,
          //   itemBuilder: (context, index, realIndex) {
          //     return buildProductCarousel(_productCarousel[index], index);
          //   },
          //   options: CarouselOptions(
          //     autoPlay: kIsWeb ? true : false,
          //     enlargeCenterPage: true,
          //     viewportFraction: 0.7,
          //     height: size.height * 0.25,
          //     aspectRatio: 1 / 1,
          //     onPageChanged: (index, reason) {
          //       setState(() {
          //         _productActiveIndex = index;
          //         _productName = _productCarousel[index].name;
          //         _productAlias = _productCarousel[index].alias;
          //         _productPrice = _productCarousel[index].price;
          //       });
          //     },
          //   ),
          // ),
          // Center(
          //   child: Column(
          //     children: [
          //       Text(
          //         _productName,
          //         style: defaultHeader2,
          //       ),
          //       Text(_productAlias),
          //       Text(
          //         '\$$_productPrice',
          //         style: secondaryHeader1,
          //       ),
          //     ],
          //   ),
          // ),
          // if (kIsWeb) ...[
          //   Center(
          //     child: buildCarouselIndicator(
          //       activeIndex: _productActiveIndex,
          //       count: _productCarousel.length,
          //       controller: _productCarouselController,
          //     ),
          //   ),
          // ],
          const SizedBox(height: 16),
          Divider(height: 4, thickness: 4, color: dividerColor),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Most Sales This Week',
              style: defaultHeader2,
            ),
          ),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  crossAxisCount: 4,
                );
              }

              return GridItemsWidget(
                listProduct: _productList,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                crossAxisCount: 6,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildBannerCarousel(String bannerUrl, int index, Size size) {
    return SizedBox(
      width: size.width,
      child: Image.asset(
        bannerUrl,
        fit: kIsWeb ? BoxFit.fitWidth : BoxFit.cover,
      ),
    );
  }

  Widget buildCarouselIndicator({
    required int activeIndex,
    required int count,
    required CarouselController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: WormEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: dividerColor,
          activeDotColor: tertiaryColor,
        ),
      ),
    );
  }

  Widget buildProductCarousel(Product productCarousel, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: productCarousel),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
            width: 280,
            height: 280,
            child: Image.asset(
              productCarousel.imgUrls[0],
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 32,
                  ),
                );
              },
            )),
      ),
    );
  }
}

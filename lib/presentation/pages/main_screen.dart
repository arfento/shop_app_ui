// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shop_app_ui/data/models/user.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/presentation/pages/cart_page.dart';
import 'package:shop_app_ui/presentation/pages/home_page.dart';
import 'package:shop_app_ui/presentation/pages/search_page.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late final List<StatefulWidget> _pages;

  int _currentIndex = 0;
  String _title = 'Discover';

  @override
  void initState() {
    super.initState();
    _pages = <StatefulWidget>[
      HomePage(user: widget.user),
      const SearchPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: _title),
      body: buildMainScreen(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar buildAppbar({required String title}) {
    return AppBar(
      title: Text(
        title,
        style: defaultHeader1,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: secondaryColor,
              child: Image.asset(
                widget.user.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
      elevation: 0.8,
      titleSpacing: 16,
      toolbarHeight: 64,
      backgroundColor: backGroundColor,
    );
  }

  StatefulWidget buildMainScreen() => _pages[_currentIndex];

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0.5,
            color: dividerColor,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: "Home",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (index) {
                case 0:
                  _title = "Discover";
                  break;
                case 1:
                  _title = "Explore";
                  break;
              }
            });
          },
        ),
      ),
    );
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ));
      },
      tooltip: 'Cart',
      backgroundColor: primaryColor,
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}

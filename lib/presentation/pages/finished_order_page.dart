import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/button_style.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/styles/text_style.dart';
import 'package:shop_app_ui/data/utils/user_preferences.dart';
import 'package:shop_app_ui/presentation/pages/main_screen.dart';
import 'package:shop_app_ui/presentation/widgets/loading_widget.dart';

class FinishedOrderPage extends StatefulWidget {
  const FinishedOrderPage({Key? key}) : super(key: key);

  @override
  State<FinishedOrderPage> createState() => _FinishedOrderPageState();
}

class _FinishedOrderPageState extends State<FinishedOrderPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        return buildMainScreen(context);
      },
    );
  }

  Widget buildMainScreen(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/Delivery-cuate.svg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              "Nice, your order is being delivered!",
              style: defaultHeader2,
            ),
            Text(
              "While waiting, let\'s look at the other plants.",
              style: TextStyle(color: secondaryTextColor),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen(
                          user: UserPreferences.getUser(Const.userId)!);
                    },
                  ),
                  (route) => false,
                );
              },
              style: elevatedButtonStyle,
              child: const Text(
                "Discover Another Products",
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_ui/data/utils/cart_preferences.dart';
import 'package:shop_app_ui/data/utils/const.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';
import 'package:shop_app_ui/data/utils/user_preferences.dart';
import 'package:shop_app_ui/presentation/pages/login_page.dart';
import 'package:shop_app_ui/presentation/pages/main_screen.dart';
import 'package:shop_app_ui/presentation/widgets/loading_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: backGroundColor,
  ));

  // initialize user and cart preferences
  await UserPreferences.init();
  await CartPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              displayColor: primaryTextColor,
              bodyColor: primaryTextColor,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          background: backGroundColor,
          outline: secondaryTextColor,
          shadow: secondaryTextColor,
        ),
        scaffoldBackgroundColor: backGroundColor,
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (UserPreferences.getUser(Const.userId) == null) {
                return const LoginPage();
              }

              return MainScreen(user: UserPreferences.getUser(Const.userId)!);
            }
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitPulse(
            size: 60,
            color: secondaryColor,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Please wait...')
        ],
      )),
    );
  }
}

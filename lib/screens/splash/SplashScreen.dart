import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import 'SplashController.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: _body());
    });
  }

  _body() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(APP_LOGO),
          // child: assetImage( image: APP_LOGO ,height: 40.0,width: 250.0,fit: BoxFit.cover );
        ),
      ],
    );
  }
}

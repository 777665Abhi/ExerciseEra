import 'dart:async';

import '../../constants/exports.dart';

class SplashController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    appFlow();
    // Timer(const Duration(seconds: 3),(){
    //   // Get.offNamed(AppRoutes.HOME);
    //   Get.offNamed(AppRoutes.HOME);
    // });
    super.onInit();
  }

  appFlow() async {
    final SharedPreferences prefs = await _prefs;
    debugPrint('${prefs.getBool('isLogin')}');
    var condition = prefs.getBool('isLogin');
    if (condition == null) {
      {
        Timer(const Duration(seconds: 3), () {
          Get.offNamed(AppRoutes.HOME);
        });
      }
    } else {
      if (condition!) {
        Timer(const Duration(seconds: 3), () {
          Get.offNamed(AppRoutes.MYCOURSE);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.offNamed(AppRoutes.HOME);
        });
      }
    }
  }
}

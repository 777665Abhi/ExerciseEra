import 'package:exercise_era/constants/exports.dart';
import 'package:exercise_era/screens/login/LoginController.dart';

class LoginBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}
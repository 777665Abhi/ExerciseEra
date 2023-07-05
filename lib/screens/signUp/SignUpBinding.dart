import 'package:exercise_era/constants/exports.dart';
import 'package:exercise_era/screens/signUp/SignUpController.dart';

class SignUpBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
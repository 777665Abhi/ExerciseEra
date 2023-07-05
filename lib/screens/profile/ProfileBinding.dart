import 'package:exercise_era/constants/exports.dart';
import 'package:exercise_era/screens/profile/ProfileController.dart';

class ProfileBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }

}
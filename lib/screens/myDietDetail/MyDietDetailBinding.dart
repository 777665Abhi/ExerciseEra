import 'package:exercise_era/screens/myDietDetail/MyDietDetailController.dart';

import '../../constants/exports.dart';

class MyDietDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyDietDetailController());
  }
}

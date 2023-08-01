
import '../../constants/exports.dart';
import 'MyDietController.dart';

class MyDietBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyDietController());
  }
}

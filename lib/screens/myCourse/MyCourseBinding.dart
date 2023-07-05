import 'package:exercise_era/constants/exports.dart';
import 'MyCourseController.dart';

class MyCourseBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => MyCourseController());
  }
}
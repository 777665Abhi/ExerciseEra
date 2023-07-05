import 'package:exercise_era/constants/exports.dart';
import 'package:exercise_era/screens/courseScreen/CourseDetailController.dart';

class CourseDetailBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => CourseDetailController());
  }

}
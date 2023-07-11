import 'package:exercise_era/screens/myCourseDetail/MyCourseDetailController.dart';
import '../../constants/exports.dart';

class MyCourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyCourseDetailController());
  }
}


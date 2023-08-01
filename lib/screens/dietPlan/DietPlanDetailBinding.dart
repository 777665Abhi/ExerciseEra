import 'package:exercise_era/screens/dietPlan/DietPlanController.dart';

import '../../constants/exports.dart';

class DietPlanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DietPlanDetailController());
  }
}

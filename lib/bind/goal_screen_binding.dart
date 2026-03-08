import 'package:get/get.dart';
import '../views/goal_screen/controller/goal_screen_controller.dart';

class GoalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalScreenController>(() => GoalScreenController());
  }
}

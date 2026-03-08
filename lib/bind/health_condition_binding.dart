import 'package:get/get.dart';
import '../views/health_condition/controller/health_condition_controller.dart';

class HealthConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthConditionController>(() => HealthConditionController());
  }
}

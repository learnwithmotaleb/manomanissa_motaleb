import 'package:get/get.dart';
import '../views/hydration/controller/hydration_controller.dart';

class HydrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HydrationController>(() => HydrationController());
  }
}

import 'package:get/get.dart';
import '../views/sleep/controller/sleep_controller.dart';

class SleepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepController>(() => SleepController());
  }
}

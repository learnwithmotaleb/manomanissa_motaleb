import 'package:get/get.dart';
import '../views/check/controller/check_controller.dart';

class CheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckController>(() => CheckController());
  }
}

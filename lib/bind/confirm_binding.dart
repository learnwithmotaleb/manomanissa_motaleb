import 'package:get/get.dart';
import '../views/confirm/controller/confirm_controller.dart';

class ConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmController>(() => ConfirmController());
  }
}

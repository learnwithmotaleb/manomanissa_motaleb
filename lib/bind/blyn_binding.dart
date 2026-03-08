import 'package:get/get.dart';
import '../views/blyn/controller/blyn_controller.dart';

class BlynBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlynController>(() => BlynController());
  }
}

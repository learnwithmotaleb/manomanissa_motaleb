import 'package:get/get.dart';
import 'package:manomanissa/views/blyn/controller/blyn_controller.dart';
import 'package:manomanissa/views/home/controller/home_controller.dart';
import 'package:manomanissa/views/setting/controller/setting_controller.dart';
import '../views/check/controller/check_controller.dart';
import '../views/navigation/controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<CheckController>(() => CheckController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BlynController>(() => BlynController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}

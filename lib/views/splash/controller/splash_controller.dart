import '../../../core/utils/basic_import.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      if (AppStorage.isLoggedIn) {
        Get.offAllNamed(Routes.navigationScreen);
      } else {
        Get.offAllNamed(Routes.welcomeScreen);
      }
    });
  }
}

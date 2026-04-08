import '../../../core/utils/basic_import.dart';

class SplashController extends GetxController {
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (AppStorage.isLoggedIn) {
        Get.offAllNamed(Routes.navigationScreen);
      } else {
        Get.offAllNamed(Routes.welcomeScreen);
      }
    });
  }
}

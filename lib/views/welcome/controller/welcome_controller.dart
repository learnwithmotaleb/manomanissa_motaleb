import '../../../core/utils/basic_import.dart';
class WelcomeController extends GetxController {



  final currentLang = (AppStorage.languageCode).obs;

  void toggleLanguage() {
    if (currentLang.value == 'en') {
      currentLang.value = 'fr';
      Get.updateLocale(const Locale('fr', 'FR'));
      AppStorage.saveLanguage('fr');
    } else {
      currentLang.value = 'en';
      Get.updateLocale(const Locale('en', 'US'));
      AppStorage.saveLanguage('en');
    }
  }







}

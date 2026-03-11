import '../../../core/utils/basic_import.dart';

class LanguageController extends GetxController {
  final selectedLanguage = AppStorage.languageCode.obs;

  final languages = [
    {'code': 'fr', 'name': Strings.french, 'flag': Assets.icons.fr.path},
    {'code': 'en', 'name': Strings.english, 'flag': Assets.icons.en.path},
  ];

  void selectLanguage(String code) {
    selectedLanguage.value = code;
  }

  void onContinue() {
    if (selectedLanguage.value == 'fr') {
      Get.updateLocale(const Locale('fr', 'FR'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    AppStorage.saveLanguage(selectedLanguage.value);
    Get.back();
  }
}
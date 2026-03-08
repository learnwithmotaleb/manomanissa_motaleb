import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';
import '../controller/language_controller.dart';

part 'language_screen_mobile.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: LanguageScreenMobile());
  }
}

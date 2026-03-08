import '../../../core/utils/basic_import.dart';
import '../controller/setting_controller.dart';

part 'setting_screen_mobile.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SettingScreenMobile());
  }
}

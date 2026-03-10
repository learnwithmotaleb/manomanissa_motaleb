import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';
import '../controller/about_controller.dart';

part 'about_screen_mobile.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AboutScreenMobile());
  }
}

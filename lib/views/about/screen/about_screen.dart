import '../../../core/utils/basic_import.dart';
import '../controller/about_controller.dart';

part 'about_screen_mobile.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AboutScreenMobile());
  }
}

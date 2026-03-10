import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';
import '../controller/security_controller.dart';

part 'security_screen_mobile.dart';

class SecurityScreen extends GetView<SecurityController> {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SecurityScreenMobile());
  }
}

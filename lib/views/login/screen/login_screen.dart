import '../../../core/utils/basic_import.dart';
import '../controller/login_controller.dart';

part 'login_screen_mobile.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: LoginScreenMobile());
  }
}

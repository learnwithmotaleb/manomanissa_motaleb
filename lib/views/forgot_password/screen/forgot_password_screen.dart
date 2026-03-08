import '../../../core/utils/basic_import.dart';
import '../controller/forgot_password_controller.dart';
part 'forgot_password_screen_mobile.dart';


class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ForgotPasswordScreenMobile());
  }
}

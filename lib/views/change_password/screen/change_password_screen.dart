import '../../../core/utils/basic_import.dart';
import '../controller/change_password_controller.dart';

part 'change_password_screen_mobile.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ChangePasswordScreenMobile());
  }
}

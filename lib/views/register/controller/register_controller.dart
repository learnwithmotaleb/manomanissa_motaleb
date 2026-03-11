import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';

class RegisterController extends GetxController {
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  final confirmPasswordFocus = FocusNode();

  // email
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final isEmailValid = false.obs;


  // password
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  RxBool isLoading = false.obs;

  registerProcess() async {
    return await AuthService.registerService(
      isLoading: isLoading,
      email: emailController.text,
      password: passwordController.text,
      role: 'USER',
    );
  }
}

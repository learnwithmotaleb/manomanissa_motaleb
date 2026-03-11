import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';
class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();


  @override
  void onInit() {
    super.onInit();
    emailController.text =  'user1.mono@yopmail.com';
    passwordController.text =  'securepass';
  }

  RxBool isLoading = false.obs;

  loginProcess() async {
    return await AuthService.loginService(
      isLoading: isLoading,
      email: emailController.text,
      password: passwordController.text,
    );
  }

}
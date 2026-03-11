import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';
class ForgotPasswordController extends GetxController {


  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  forgotPasswordProcess() async {
    return await AuthService.forgotPasswordService(
      isLoading: isLoading,
      email: emailController.text,
    );
  }







}

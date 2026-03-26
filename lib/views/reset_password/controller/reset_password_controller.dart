import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';
class ResetPasswordController extends GetxController {


  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();



  RxBool isLoading = false.obs;

  resetPasswordProcess() async {
    return await AuthService.resetPasswordService(
      isLoading: isLoading,
      password: passwordController.text,
    );
  }


}

import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';
class ChangePasswordController extends GetxController {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //new password
  final oldPasswordController = TextEditingController();
  final isOldPasswordFocus = FocusNode();

  // password
  final passConfirmController = TextEditingController();
  final confirmPasswordFocus = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;

  // Change Password APi
  RxBool isLoading = false.obs;

  Future<BasicSuccessModel> changePasswordProcess() async {
    return await AuthService.changePasswordService(
      isLoading: isLoading,
      oldPassword: oldPasswordController.text,
      newPassword: passwordController.text,
    );
  }





}

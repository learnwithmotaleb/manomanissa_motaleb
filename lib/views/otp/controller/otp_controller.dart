import 'package:manomanissa/views/forgot_password/controller/forgot_password_controller.dart';

import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';
class OtpController extends GetxController {

final otpController = TextEditingController();



  RxBool isLoading = false.obs;

  otpVerifyProcess() async {
    return await AuthService.forgotOtpVerifyService(
      isLoading: isLoading,
      code: otpController.text,
      email: Get.find<ForgotPasswordController>().emailController.text,
    );
  }





}

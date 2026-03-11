import 'package:manomanissa/views/register/controller/register_controller.dart';

import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';

class VerificationController extends GetxController {
  final otpController = TextEditingController();
  final email = ''.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.find<RegisterController>().emailController.text;
  }

  otpVerifyProcess() async {
    return await AuthService.registerOtpVerifyService(
      isLoading: isLoading,
      code: otpController.text,
      email: email.value,
    );
  }
}

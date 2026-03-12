import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class SupportController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<void> sendSupport() async {
    await ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: '/contact',
      isLoading: isLoading,
      showSuccessSnackBar: true,
      body: {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "message": messageController.text.trim(),
      },
      onSuccess: (result) => Get.back(),
    );
  }
}

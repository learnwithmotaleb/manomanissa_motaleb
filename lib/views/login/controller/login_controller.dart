import '../../../core/utils/basic_import.dart';
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final isLoading = false.obs;


  final GlobalKey<FormState> formKey = GlobalKey();



}
import '../../../core/utils/basic_import.dart';
import '../controller/confirm_controller.dart';

part 'confirm_screen_mobile.dart';

class ConfirmScreen extends GetView<ConfirmController> {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ConfirmScreenMobile());
  }
}

import '../../../core/utils/basic_import.dart';
import '../controller/check_controller.dart';

part 'check_screen_mobile.dart';

class CheckScreen extends GetView<CheckController> {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: CheckScreenMobile());
  }
}

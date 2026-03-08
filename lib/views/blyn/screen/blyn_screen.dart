import '../../../core/utils/basic_import.dart';
import '../controller/blyn_controller.dart';

part 'blyn_screen_mobile.dart';

class BlynScreen extends GetView<BlynController> {
  const BlynScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: BlynScreenMobile());
  }
}

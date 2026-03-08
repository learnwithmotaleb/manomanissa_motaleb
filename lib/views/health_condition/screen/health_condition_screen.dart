import '../../../core/utils/basic_import.dart';
import '../controller/health_condition_controller.dart';

part 'health_condition_screen_mobile.dart';

class HealthConditionScreen extends GetView<HealthConditionController> {
  const HealthConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HealthConditionScreenMobile());
  }
}

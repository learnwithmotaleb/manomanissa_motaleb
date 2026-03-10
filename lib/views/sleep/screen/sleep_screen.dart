import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/sleep_controller.dart';
import '../widget/health_details_widget.dart';

part 'sleep_screen_mobile.dart';

class SleepScreen extends GetView<SleepController> {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SleepScreenMobile());
  }
}

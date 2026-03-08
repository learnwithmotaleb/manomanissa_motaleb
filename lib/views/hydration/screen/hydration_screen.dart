import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/basic_import.dart';
import '../../sleep/widget/health_details_widget.dart';
import '../controller/hydration_controller.dart';

part 'hydration_screen_mobile.dart';

class HydrationScreen extends GetView<HydrationController> {
  const HydrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HydrationScreenMobile());
  }
}

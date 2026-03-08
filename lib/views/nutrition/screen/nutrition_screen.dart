import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/basic_import.dart';
import '../../sleep/widget/health_details_widget.dart';
import '../controller/nutrition_controller.dart';

part 'nutrition_screen_mobile.dart';

class NutritionScreen extends GetView<NutritionController> {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NutritionScreenMobile());
  }
}

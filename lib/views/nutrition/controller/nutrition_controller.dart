import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/models/metric_model.dart';
import '../../../core/utils/basic_import.dart';

class NutritionController extends GetxController {
  final isLoading = false.obs;
  final spots7Days = <FlSpot>[].obs;
  final spots30Days = <FlSpot>[].obs;
  final bottomLabels = <String>[].obs;
  final average = "".obs;
  final suggestions = <String>[].obs;
  final progressValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNutritionData();
  }

  Future<void> fetchNutritionData() async {
    await ApiRequest().get(
      fromJson: MetricModel.fromJson,
      endPoint: ApiEndPoints.nutritionMetric,
      isLoading: isLoading,
      queryParams: {"days": 30},
      onSuccess: (result) {
        final data = result.data;
        average.value = data.average;
        suggestions.assignAll(data.suggestionOfTheDay.suggestions);

        final history = data.history;
        final List<FlSpot> s30 = [];
        final List<String> labels = [];

        for (int i = 0; i < history.length; i++) {
          final entry = history[i];
          double val = entry.value.toDouble();
          s30.add(FlSpot(i.toDouble(), val));
          labels.add(DateFormat('dd/MM').format(entry.date));
        }

        spots30Days.assignAll(s30);
        bottomLabels.assignAll(labels);
        
        if (s30.length >= 7) {
          final last7 = s30.sublist(s30.length - 7);
          final List<FlSpot> s7 = [];
          for (int i = 0; i < last7.length; i++) {
            s7.add(FlSpot(i.toDouble(), last7[i].y));
          }
          spots7Days.assignAll(s7);
        } else {
          spots7Days.assignAll(s30);
        }

        if (s30.isNotEmpty) {
           progressValue.value = (s30.last.y / 2500.0).clamp(0.0, 1.0); // Target 2500 cal
        }
      },
    );
  }
}

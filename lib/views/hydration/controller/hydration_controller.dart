import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/models/metric_model.dart';
import '../../../core/utils/basic_import.dart';

class HydrationController extends GetxController {
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
    fetchHydrationData();
  }

  Future<void> fetchHydrationData() async {
    await ApiRequest().get(
      fromJson: MetricModel.fromJson,
      endPoint: ApiEndPoints.hydrationMetric,
      isLoading: isLoading,
      queryParams: {"days": 30},
      onSuccess: (result) {
        final data = result.data;
        average.value = data.average;
        suggestions.assignAll(data.suggestionOfTheDay.suggestions);

        // Map history to FlSpots
        final history = data.history;
        final List<FlSpot> s30 = [];
        final List<String> labels = [];

        for (int i = 0; i < history.length; i++) {
          final entry = history[i];
          // We convert ml to Liters for the chart if it's too large, or keep as is.
          // The JSON showed ~2000, so maybe Liter (val / 1000) is better for 0-10 range?
          // HealthDetailWidget uses chartMaxY: 10 by default.
          double val = entry.value.toDouble();
          if (val > 100) val = val / 1000.0; // Assume ml to L if > 100
          
          s30.add(FlSpot(i.toDouble(), val));
          labels.add(DateFormat('dd/MM').format(entry.date));
        }

        spots30Days.assignAll(s30);
        bottomLabels.assignAll(labels);
        
        // spots7Days: take last 7
        if (s30.length >= 7) {
          final last7 = s30.sublist(s30.length - 7);
          // Re-index for 7 days view? No, HistoryChartWidget handles switching internally.
          // But wait, HistoryChartWidget uses the SAME bottomLabels for both? 
          // Yes: LineChartBarData(spots: is7Days ? widget.spots7Days : widget.spots30Days)
          // And bottomTitles: getTitlesWidget: (value, meta) { final index = value.toInt(); ... }
          // So if is7Days is true, it will look at index 0-6 of bottomLabels and use spots7Days.
          // BUT if spots7Days are e.g. indices 23-29, the labels index 0-6 will be WRONG.
          
          // Fix: spots7Days should also start from index 0 if we want it to align with labels[0-6].
          // Or we manage labels dynamically.
          // Let's make spots7Days start from 0.0 to 6.0.
          final List<FlSpot> s7 = [];
          for (int i = 0; i < last7.length; i++) {
            s7.add(FlSpot(i.toDouble(), last7[i].y));
          }
          spots7Days.assignAll(s7);
        } else {
          spots7Days.assignAll(s30);
        }

        // progressValue: assume average or last entry vs some target 
        // For now use last entry / 3.0 (target)
        if (s30.isNotEmpty) {
           progressValue.value = (s30.last.y / 3.0).clamp(0.0, 1.0);
        }
      },
    );
  }
}

part of 'nutrition_screen.dart';

class NutritionScreenMobile extends GetView<NutritionController> {
  const NutritionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Nutrition"),
      body: SafeArea(
        child: HealthDetailWidget(
          icon: Image.asset(Assets.icons.orange.path, height: 20.h),
          progressLabel: Strings.calories,
          progressValue: 0.75,
          progressGradient: const LinearGradient(
            colors: [Color(0xFFF36800), Color(0xFFFCD78D), Color(0xFFFFFFFF)],
          ),
          infoText: Strings.belowTarget,
          chartTitle: Strings.sleepHistory,
          chartMinY: 0,
          chartMaxY: 10,
          chartInterval: 2,
          chartBottomLabels: const [
            'Sat',
            'Sun',
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
          ],
          spots7Days: const [
            FlSpot(0, 3.5),
            FlSpot(1, 4.0),
            FlSpot(2, 3.8),
            FlSpot(3, 4.2),
            FlSpot(4, 3.9),
            FlSpot(5, 5.8),
            FlSpot(6, 6.2),
          ],
          spots30Days: const [
            FlSpot(0, 4.0),
            FlSpot(1, 5.0),
            FlSpot(2, 4.5),
            FlSpot(3, 6.0),
            FlSpot(4, 5.5),
            FlSpot(5, 6.5),
            FlSpot(6, 7.0),
          ],
          suggestions: const [
            Strings.sleepTip1,
            Strings.sleepTip2,
            Strings.sleepTip3,
          ],
        ),
      ),
    );
  }
}

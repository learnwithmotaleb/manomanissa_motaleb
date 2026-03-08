part of 'hydration_screen.dart';

class HydrationScreenMobile extends GetView<HydrationController> {
  const HydrationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Hydration"),
      body: SafeArea(
        child: HealthDetailWidget(
          icon: Icon(Icons.water_drop_rounded, color: CustomColors.primary, size: 20.h),
          progressLabel: Strings.verres,
          progressValue: 0.75,
          infoText: Strings.belowTarget,
          chartTitle: Strings.sleepHistory,
          chartMinY: 0,
          chartMaxY: 10,
          chartInterval: 2,
          chartBottomLabels: const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
          spots7Days: const [
            FlSpot(0, 3.5), FlSpot(1, 4.0), FlSpot(2, 3.8),
            FlSpot(3, 4.2), FlSpot(4, 3.9), FlSpot(5, 5.8), FlSpot(6, 6.2),
          ],
          spots30Days: const [
            FlSpot(0, 4.0), FlSpot(1, 5.0), FlSpot(2, 4.5),
            FlSpot(3, 6.0), FlSpot(4, 5.5), FlSpot(5, 6.5), FlSpot(6, 7.0),
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

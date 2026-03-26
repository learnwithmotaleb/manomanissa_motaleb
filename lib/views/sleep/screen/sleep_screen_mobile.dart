part of 'sleep_screen.dart';

class SleepScreenMobile extends GetView<SleepController> {
  const SleepScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Sleep"),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value 
          ? const LoadingWidget() 
          : HealthDetailWidget(
          icon: Icon(
            Icons.bedtime,
            color: CustomColors.primary,
            size: 20.h,
          ),
          progressLabel: Strings.sleep,
          progressValue: controller.progressValue.value,
          infoText: Strings.belowTarget,
          chartTitle: controller.average.value,
          chartMinY: 0,
          chartMaxY: 10,
          chartInterval: 2,
          chartBottomLabels: controller.bottomLabels,
          spots7Days: controller.spots7Days,
          spots30Days: controller.spots30Days,
          suggestions: controller.suggestions,
        )),
      ),
    );
  }
}

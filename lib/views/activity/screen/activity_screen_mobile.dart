part of 'activity_screen.dart';

class ActivityScreenMobile extends GetView<ActivityController> {
  const ActivityScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Activity"),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value 
          ? const LoadingWidget() 
          : HealthDetailWidget(
          icon: Icon(
            Icons.directions_walk,
            color: CustomColors.primary,
            size: 20.h,
          ),
          progressLabel: Strings.activity,
          progressValue: controller.progressValue.value,
          infoText: Strings.belowTarget,
          chartTitle: controller.average.value,
          chartMinY: 0,
          chartMaxY: 10000,
          chartInterval: 2000,
          chartBottomLabels: controller.bottomLabels,
          spots7Days: controller.spots7Days,
          spots30Days: controller.spots30Days,
          suggestions: controller.suggestions,
        )),
      ),
    );
  }
}

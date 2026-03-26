part of 'hydration_screen.dart';

class HydrationScreenMobile extends GetView<HydrationController> {
  const HydrationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Hydration"),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value 
          ? const LoadingWidget() 
          : HealthDetailWidget(
          icon: Icon(
            Icons.water_drop_rounded,
            color: CustomColors.primary,
            size: 20.h,
          ),
          progressLabel: Strings.hydration,
          progressValue: controller.progressValue.value,
          infoText: Strings.belowTarget,
          chartTitle: controller.average.value,
          chartMinY: 0,
          chartMaxY: 6,
          chartInterval: 1,
          chartBottomLabels: controller.bottomLabels,
          spots7Days: controller.spots7Days,
          spots30Days: controller.spots30Days,
          suggestions: controller.suggestions,
        )),
      ),
    );
  }
}

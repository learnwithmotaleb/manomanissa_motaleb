part of 'nutrition_screen.dart';

class NutritionScreenMobile extends GetView<NutritionController> {
  const NutritionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Nutrition"),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value 
          ? const LoadingWidget() 
          : HealthDetailWidget(
          icon: Image.asset(
            Assets.icons.orange.path,
            height: 20.h,
          ),
          progressLabel: Strings.nutrition,
          progressValue: controller.progressValue.value,
          infoText: Strings.belowTarget,
          chartTitle: controller.average.value,
          chartMinY: 0,
          chartMaxY: 3000,
          chartInterval: 600,
          chartBottomLabels: controller.bottomLabels,
          spots7Days: controller.spots7Days,
          spots30Days: controller.spots30Days,
          suggestions: controller.suggestions,
        )),
      ),
    );
  }
}

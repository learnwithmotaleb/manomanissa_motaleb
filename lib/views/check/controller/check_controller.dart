import '../../../core/utils/basic_import.dart';
class CheckController extends GetxController {
  final sleepValue = 7.5.obs;
  final hydrationValue = 1.5.obs;
  final activityValue = 9000.0.obs;
  final nutritionValue = 2000.0.obs;

  void onConfirm() {
    print("Sleep: ${sleepValue.value}h");
    print("Hydration: ${hydrationValue.value}L");
    print("Activity: ${activityValue.value} steps");
    print("Nutrition: ${nutritionValue.value} cal");
    // TODO: API call
  }
}
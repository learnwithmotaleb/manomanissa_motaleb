import '../../../core/utils/basic_import.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/end_point/api_end_points.dart';
class GoalScreenController extends GetxController {



  // Step 2
  final goals = ["Sleep", "Hydration", "Activity (walking)", "Nutrition"];
  final selectedGoals = <String>[].obs;

  void toggleGoal(String goal) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
  }

  RxBool isLoading = false.obs;

  Future<void> updateGoal() async {
    if (selectedGoals.isEmpty) {
      CustomSnackBar.error("Please select at least one goal.");
      return;
    }
    await ApiRequest().patch(
      fromJson: (json) => json, // Using dynamic/void response for basic patch if no specific model
      endPoint: ApiEndPoints.onboarding,
      body: {
        "goals": selectedGoals.map((e) => e.toLowerCase()).toList()
      },
      isLoading: isLoading,
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.back();
      }
    );
  }
}

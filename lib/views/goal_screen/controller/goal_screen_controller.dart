import '../../../core/utils/basic_import.dart';
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







}

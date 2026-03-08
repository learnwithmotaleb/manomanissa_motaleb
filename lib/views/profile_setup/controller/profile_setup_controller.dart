import '../../../core/utils/basic_import.dart';

class ProfileSetupController extends GetxController {
  // Step 1
  final nameController = TextEditingController();
  final selectedDate = Rxn<DateTime>();

  // Step 2
  final goals = ["Sleep", "Hydration", "Activity (walking)", "Nutrition"];
  final selectedGoals = <String>[].obs;

  // Step 3
  final defaultConditions = ["Diabetes", "Asthma", "Hypertension", "Cholesterol"];
  final healthConditions = <String>["Diabetes", "Asthma", "Hypertension", "Cholesterol"].obs;
  final selectedConditions = <String>[].obs;
  final addMoreController = TextEditingController();

  // Step 4
  final selectedCharacter = ''.obs; // 'female' or 'male'

  // Step 5
  final selectedHeight = 168.obs;
  final selectedWeight = 58.obs;

  final currentStep = 0.obs;
  final totalSteps = 5;

  // Height & Weight lists
  final heights = List.generate(50, (i) => 140 + i); // 140 - 189
  final weights = List.generate(100, (i) => 30 + i); // 30 - 129

  late FixedExtentScrollController heightScrollController;
  late FixedExtentScrollController weightScrollController;

  @override
  void onInit() {
    super.onInit();
    heightScrollController = FixedExtentScrollController(
      initialItem: heights.indexOf(selectedHeight.value),
    );
    weightScrollController = FixedExtentScrollController(
      initialItem: weights.indexOf(selectedWeight.value),
    );
  }

  // Step 1
  void goToNextStep() {
    if (nameController.text.trim().isEmpty) {
      CustomSnackBar.error(Strings.pleaseFillOutTheField);
      return;
    }
    currentStep.value = 1;
  }

  // Step 2
  void toggleGoal(String goal) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
  }

  void onGoalContinue() {
    if (selectedGoals.isEmpty) {
      CustomSnackBar.error("Please select at least one goal");
      return;
    }
    currentStep.value = 2;
  }

  // Step 3
  void toggleCondition(String condition) {
    if (selectedConditions.contains(condition)) {
      selectedConditions.remove(condition);
    } else {
      selectedConditions.add(condition);
    }
  }

  void addMoreCondition() {
    final text = addMoreController.text.trim();
    if (text.isEmpty) return;
    if (!healthConditions.contains(text)) {
      healthConditions.add(text);
      selectedConditions.add(text);
    }
    addMoreController.clear();
    Get.back();
  }

  void showAddMoreDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF1E1E2E),
        title: TextWidget(
          "Add Condition",
          color: CustomColors.whiteColor,
          fontSize: Dimensions.titleSmall,
        ),
        content: PrimaryInputFieldWidget(
          controller: addMoreController,
          hintText: "Enter condition name",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: TextWidget("Cancel", color: CustomColors.primary),
          ),
          TextButton(
            onPressed: addMoreCondition,
            child: TextWidget("Add", color: CustomColors.primary),
          ),
        ],
      ),
    );
  }

  void onConditionContinue() {
    currentStep.value = 3;
  }

  // Step 4
  void selectCharacter(String character) {
    selectedCharacter.value = character;
  }

  void onCharacterContinue() {
    if (selectedCharacter.value.isEmpty) {
      CustomSnackBar.error("Please choose a character");
      return;
    }
    currentStep.value = 4;
  }

  // Step 5
  void onFinalContinue() {
    print("===== PROFILE SETUP DATA =====");
    print("Name: ${nameController.text}");
    print("Date of Birth: ${selectedDate.value}");
    print("Goals: ${selectedGoals.toList()}");
    print("Health Conditions: ${selectedConditions.toList()}");
    print("Character: ${selectedCharacter.value}");
    print("Height: ${selectedHeight.value} cm");
    print("Weight: ${selectedWeight.value} kg");
    print("==============================");

    Get.toNamed(Routes.navigationScreen);
  }

  @override
  void onClose() {
    nameController.dispose();
    addMoreController.dispose();
    heightScrollController.dispose();
    weightScrollController.dispose();
    super.onClose();
  }
}
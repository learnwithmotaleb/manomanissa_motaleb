import 'package:manomanissa/core/api/model/basic_success_model.dart';
import 'package:manomanissa/core/api/services/api_request.dart';

import '../../../core/utils/basic_import.dart';

class ProfileSetupController extends GetxController {
  // Step 1
  final nameController = TextEditingController();
  final selectedDate = Rxn<DateTime>();

  // Step 2
  final goal = ["Sleep", "Hydration", "Activity (walking)", "Nutrition"];
  final selectedGoals = <String>[].obs;

  // Step 3
  final defaultConditions = [
    "Diabetes",
    "Asthma",
    "Hypertension",
    "Cholesterol",
  ];
  final healthConditions = <String>[
    "Diabetes",
    "Asthma",
    "Hypertension",
    "Cholesterol",
  ].obs;
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
    currentStep.value = 1; // → Health Conditions
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
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E2E),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔹 Title
              Row(
                children: [
                  Icon(Icons.add_circle_outline,
                      color: CustomColors.primary, size: 26),
                  SizedBox(width: 8),
                  TextWidget(
                    "Add Condition",
                    fontSize: Dimensions.titleSmall,
                    color: CustomColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),

              SizedBox(height: Dimensions.verticalSize),

              /// 🔹 Input Field
              PrimaryInputFieldWidget(
                controller: addMoreController,
                hintText: "Enter condition name",
              ),

              SizedBox(height: Dimensions.paddingSize * 0.5),

              /// 🔹 Buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSize * 0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: CustomColors.primary.withOpacity(0.5),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(
                          "Cancel",
                          color: CustomColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: GestureDetector(
                      onTap: addMoreCondition,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSize * 0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              CustomColors.primary,
                              CustomColors.primary.withOpacity(0.7),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(
                          "Add",
                          color: CustomColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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


  RxBool isCompletingLoading = false.obs;

  Future<BasicSuccessModel> completeProfile() async {
    return await ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: '/profile',
      isLoading: isCompletingLoading,
      body: {
        'name': nameController.text,
        'dateOfBirth': selectedDate.value?.toIso8601String(),
        'gender': selectedCharacter.value.toUpperCase(),
        // 'goals': selectedGoals.toList(),
        // 'healthConditions': selectedConditions.toList(),
        'heightCm': selectedHeight.value,
        'weightKg': selectedWeight.value,
      },
      onSuccess: (result) {

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
      },
    );
  }

  void onConditionContinue() {
    currentStep.value = 2;
  }

  final isGoalHealthLoading = false.obs;

  Future<void> submitGoalAndHealth() async {
    if (selectedGoals.isEmpty) {
      CustomSnackBar.error("Please select at least one goal");
      return;
    }

    await ApiRequest().post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: '/onboarding',
      isLoading: isGoalHealthLoading,
      body: {
        "goal": selectedGoals.map((g) => g.toLowerCase()).toList(),
        "healthConditions": selectedConditions.map((h) => h.toLowerCase()).toList(),
      },
      onSuccess: (result) {
        currentStep.value = 3;
      },
    );
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

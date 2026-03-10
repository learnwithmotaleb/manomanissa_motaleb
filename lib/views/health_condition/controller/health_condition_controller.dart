import '../../../core/utils/basic_import.dart';
class HealthConditionController extends GetxController {



  void toggleCondition(String condition) {
    if (selectedConditions.contains(condition)) {
      selectedConditions.remove(condition);
    } else {
      selectedConditions.add(condition);
    }
  }
  final selectedConditions = <String>[].obs;

  final healthConditions = <String>["Diabetes", "Asthma", "Hypertension", "Cholesterol"].obs;

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

  final addMoreController = TextEditingController();

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



}

import '../../../core/utils/basic_import.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/end_point/api_end_points.dart';

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
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 3),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.defaultHorizontalSize * 1.2,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E2E), // sleek dark card background
            borderRadius: BorderRadius.circular(Dimensions.radius * 3),
            border: Border.all(
              color: CustomColors.primary.withOpacity(0.35),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColors.primary.withOpacity(0.15),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.health_and_safety_outlined, color: CustomColors.primary, size: 24.h),
                      Space.width.v10,
                      TextWidget(
                        Strings.addCondition,
                        color: CustomColors.whiteColor,
                        fontSize: Dimensions.titleMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addMoreController.clear();
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close, 
                        color: CustomColors.whiteColor.withOpacity(0.6),
                        size: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
              Space.height.v25,
              PrimaryInputFieldWidget(
                controller: addMoreController,
                hintText: Strings.enterConditionName,
              ),
              Space.height.v30,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                         Get.back();
                         addMoreController.clear();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                          border: Border.all(color: CustomColors.whiteColor.withOpacity(0.2)),
                        ),
                        child: TextWidget(Strings.cancel, color: CustomColors.whiteColor.withOpacity(0.8), fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Space.width.v15,
                  Expanded(
                    child: GestureDetector(
                       onTap: addMoreCondition,
                       child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColors.primary,
                          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextWidget(Strings.add, color: CustomColors.whiteColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.6),
    );
  }

  RxBool isLoading = false.obs;

  Future<void> updateHealthCondition() async {
    await ApiRequest().patch(
      fromJson: (json) => json,
      endPoint: ApiEndPoints.onboarding,
      body: {
        "healthConditions": selectedConditions.map((e) => e.toLowerCase()).toList()
      },
      isLoading: isLoading,
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.back();
      }
    );
  }
}

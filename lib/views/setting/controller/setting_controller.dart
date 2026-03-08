import '../../../core/utils/basic_import.dart';

class SettingController extends GetxController {
  void onEditProfile() => Get.toNamed(Routes.update_profileScreen);

  void onLanguage() => Get.toNamed(Routes.languageScreen);

  void onGoals() => Get.toNamed(Routes.goal_screenScreen);

  void onHealthConditions() => Get.toNamed(Routes.goal_screenScreen);

  void onSecurity() => Get.toNamed(Routes.securityScreen);

  void onSubscription() => Get.toNamed(Routes.goal_screenScreen);

  void onAbout() => Get.toNamed(Routes.aboutScreen);

  void onLogOut() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF0D1B2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          side: BorderSide(
            color: CustomColors.primary.withOpacity(0.3),
            width: 1.2,
          ),
        ),
        title: TextWidget(
          Strings.logOut,
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.w700,
          color: CustomColors.whiteColor,
        ),
        content: TextWidget(
          "Are you sure you want to log out?",
          fontSize: Dimensions.bodyMedium,
          color: CustomColors.whiteColor.withOpacity(0.7),
          fontWeight: FontWeight.w400,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: TextWidget(
              "Cancel",
              color: CustomColors.whiteColor.withOpacity(0.5),
              fontSize: Dimensions.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.loginScreen);
            },
            child: TextWidget(
              Strings.logOut,
              color: CustomColors.rejected,
              fontWeight: FontWeight.w700,
              fontSize: Dimensions.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

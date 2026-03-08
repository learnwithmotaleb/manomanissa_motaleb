part of 'login_screen.dart';

class LoginScreenMobile extends GetView<LoginController> {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),

            // Title
            TextWidget(
              Strings.logIn,
              fontSize: Dimensions.headlineSmall,
              fontWeight: FontWeight.w600,
              color: CustomColors.whiteColor,
              textAlign: TextAlign.center,
            ),
            Space.height.v30,

            // Email Field
            PrimaryInputFieldWidget(
              controller: controller.emailController,
              hintText: Strings.email,
              prefixIcon: Icon(Icons.email, color: CustomColors.primary),
              isEmail: true,
              keyBoardType: TextInputType.emailAddress,
              nextFocusNode: controller.passwordFocusNode,
            ),
            Space.height.v20,

            // Password Field
            PrimaryInputFieldWidget(
              controller: controller.passwordController,
              hintText: Strings.enterPassword,
              isPassword: true,
              prefixIcon: Icon(Icons.lock, color: CustomColors.primary),

              focusNode: controller.passwordFocusNode,
            ),
            Space.height.v25,

            // Login Button
            Obx(
              () => PrimaryButtonWidget(
                title: Strings.logIn,
                onPressed: () => Get.offAllNamed(Routes.navigationScreen),
                isLoading: controller.isLoading.value,
              ),
            ),
            Space.height.v20,

            // Forgot Password
            TextWidget(
              Strings.forgotPassword,
              color: CustomColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.bodyMedium,
              textAlign: TextAlign.center,
              onTap: () => Get.toNamed(Routes.forgot_passwordScreen),
            ),
            Space.height.v15,

            // Register Row
            Row(
              mainAxisAlignment: mainCenter,
              children: [
                TextWidget(
                  Strings.iDontHaveAnAccount,
                  color: CustomColors.whiteColor,
                  fontSize: Dimensions.bodyMedium,
                ),
                Space.width.v5,
                Icon(
                  Icons.arrow_forward,
                  color: CustomColors.primary,
                  size: 14,
                ),
                Space.width.v5,
                TextWidget(
                  Strings.createAnAccount,
                  color: CustomColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.bodyMedium,
                  onTap: () => Get.toNamed(Routes.registerScreen),
                ),
              ],
            ),
            Space.height.v25,

            // FAQ
            Row(
              mainAxisAlignment: mainCenter,
              children: [
                Image.asset(Assets.icons.q.path, height: 18.h),
                Space.width.v10,
                TextWidget(
                  Strings.frequentlyAskedQuestions,
                  color: CustomColors.primary,
                  fontSize: Dimensions.bodySmall,
                  onTap: () {
                    Get.toNamed(Routes.questionsScreen);
                  },
                ),
              ],
            ),
            Space.height.v15,

            // Contact & Support
            Row(
              mainAxisAlignment: mainCenter,
              children: [
                Icon(
                  Icons.info_outline,
                  color: CustomColors.primary,
                  size: 18.h,
                ),
                Space.width.v10,
                TextWidget(
                  Strings.contactSupportHelp,
                  color: CustomColors.primary,
                  fontSize: Dimensions.bodySmall,
                  onTap: () {
                    Get.toNamed(Routes.supportScreen);

                  },
                ),
              ],
            ),
            Space.height.v30,
          ],
        ),
      ),
    );
  }
}

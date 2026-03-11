part of 'register_screen.dart';

class RegisterScreenMobile extends GetView<RegisterController> {
  const RegisterScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Space.height.v100,
                    TextWidget(
                      textAlign: TextAlign.center,
                      Strings.createAccount,
                      fontSize: Dimensions.titleLarge,
                    ),
                    Space.height.betweenInputBox,
                    Space.height.betweenInputBox,

                    // Email Field
                    PrimaryInputFieldWidget(
                      controller: controller.emailController,
                      hintText: Strings.email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: CustomColors.primary,
                      ),
                      isEmail: true,
                      keyBoardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocus,
                      nextFocusNode: controller.passwordFocus,
                    ),
                    Space.height.betweenInputBox,
                    // Password Field
                    PrimaryInputFieldWidget(
                      isPassword: true,
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocus,
                      nextFocusNode: controller.confirmPasswordFocus,
                      hintText: Strings.enterPassword,
                      prefixIcon: Icon(Icons.lock, color: CustomColors.primary),
                    ),
                    Space.height.betweenInputBox,

                    PrimaryInputFieldWidget(
                      hintText: Strings.confirmPass,
                      isPassword: true,
                      controller: controller.passConfirmController,
                      focusNode: controller.confirmPasswordFocus,
                      nextFocusNode: null,
                      confirmWith: controller.passwordController,
                      prefixIcon: Icon(Icons.lock, color: CustomColors.primary),
                    ),
                    Space.height.v25,
                    Obx(
                      () => PrimaryButtonWidget(
                        title: Strings.continues,
                        onPressed: () => controller.registerProcess(),
                        isLoading: controller.isLoading.value,
                      ),
                    ),
                    Space.height.v15,

                    Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        TextWidget(
                          Strings.alreadyHaveAccount,
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
                          Strings.logIn,
                          color: CustomColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.bodyMedium,
                          onTap: () => Get.offAllNamed(Routes.loginScreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

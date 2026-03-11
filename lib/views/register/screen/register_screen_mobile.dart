part of 'register_screen.dart';

class RegisterScreenMobile extends GetView<RegisterController> {
  const RegisterScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
                      nextFocusNode: controller.passwordFocusNode,
                    ),
                    Space.height.betweenInputBox,
                    // Password Field
                    PrimaryInputFieldWidget(
                      controller: controller.passwordController,
                      hintText: Strings.enterPassword,
                      isPassword: true,
                      prefixIcon: Icon(Icons.lock, color: CustomColors.primary),
                      focusNode: controller.passwordFocusNode,
                    ),
                    Space.height.betweenInputBox,

                    PrimaryInputFieldWidget(
                      controller: controller.confirmPasswordController,
                      hintText: Strings.confirmPass,
                      isPassword: true,
                      prefixIcon: Icon(Icons.lock, color: CustomColors.primary),
                      focusNode: controller.passwordFocusNode,
                    ),
                    Space.height.v25,
                    Obx(
                      () => PrimaryButtonWidget(
                        title: Strings.continues,
                        onPressed: () => Get.toNamed(Routes.verificationScreen),
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

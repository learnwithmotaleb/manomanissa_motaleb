part of 'reset_password_screen.dart';

class ResetPasswordScreenMobile extends GetView<ResetPasswordController> {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Center(
            child: Column(
              crossAxisAlignment: crossCenter,

              children: [
                Space.height.v100,
                TextWidget(
                  textAlign: TextAlign.center,
                  Strings.forgotYourPassword,
                  fontSize: Dimensions.titleLarge,
                ),
                TextWidget(
                  Strings.forgotPasswordDescription,
                  textAlign: TextAlign.center,

                  fontSize: Dimensions.titleSmall,
                ),
                Space.height.v30,
                // Email Field
                PrimaryInputFieldWidget(
                  controller: controller.passwordController,
                  hintText: Strings.enterPassword,
                  isPassword: true,
                  keyBoardType: TextInputType.emailAddress,
                ),
                Space.height.betweenInputBox,
                PrimaryInputFieldWidget(
                  controller: controller.confirmPasswordController,
                  hintText: Strings.confirmPass,
                  isPassword: true,
                  keyBoardType: TextInputType.emailAddress,
                ),
                Space.height.betweenInputBox,

                PrimaryButtonWidget(
                  title: Strings.changePass,
                  onPressed: () {
                    Get.toNamed(Routes.confirmScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

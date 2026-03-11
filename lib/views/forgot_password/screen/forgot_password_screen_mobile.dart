part of 'forgot_password_screen.dart';

class ForgotPasswordScreenMobile extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreenMobile({super.key});

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
                  controller: controller.emailController,
                  hintText: Strings.email,
                  prefixIcon: Icon(Icons.email, color: CustomColors.primary),
                  isEmail: true,
                  keyBoardType: TextInputType.emailAddress,
                ),
                Space.height.betweenInputBox,

                Obx(
                  () => PrimaryButtonWidget(
                    title: Strings.sendConfirmation,
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      controller.forgotPasswordProcess();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

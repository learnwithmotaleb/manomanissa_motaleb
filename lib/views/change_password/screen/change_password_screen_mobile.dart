part of 'change_password_screen.dart';

class ChangePasswordScreenMobile extends GetView<ChangePasswordController> {
  const ChangePasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,

          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Space.height.v40,

                TextWidget(
                  Strings.changePass,
                  fontSize: Dimensions.headlineSmall,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.whiteColor,
                ),
                Space.height.v40,

                Space.height.betweenInputBox,
                PrimaryInputFieldWidget(
                  hintText: "Previous Password",
                  isPassword: true,
                  controller: controller.oldPasswordController,
                  focusNode: controller.isOldPasswordFocus,
                  nextFocusNode: controller.passwordFocus,
                ),
                Space.height.betweenInputBox,
                PrimaryInputFieldWidget(
                  hintText: "New password",
                  isPassword: true,
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocus,
                  nextFocusNode: controller.confirmPasswordFocus,
                ),
                Space.height.betweenInputBox,
                PrimaryInputFieldWidget(
                  hintText: "Confirm password",
                  isPassword: true,
                  controller: controller.passConfirmController,
                  focusNode: controller.confirmPasswordFocus,
                  nextFocusNode: null,
                  confirmWith:
                      controller.passwordController,
                ),
                Space.height.betweenInputBox,
                Space.height.betweenInputBox,
                Obx(
                  () => PrimaryButtonWidget(
                    title: 'Update Password',
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        // controller.changePasswordProcess();
                      }
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

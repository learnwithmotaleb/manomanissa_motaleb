part of 'otp_screen.dart';

class OtpScreenMobile extends GetView<OtpController> {
  const OtpScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossCenter,

              children: [
                Space.height.v100,
                TextWidget(
                  textAlign: TextAlign.center,
                  Strings.verification,
                  fontSize: Dimensions.titleLarge,
                ),
                TextWidget(
                  Strings.enterYourSIzDIGitCode,
                  textAlign: TextAlign.center,

                  fontSize: Dimensions.titleSmall,
                ),
                Space.height.v30,
                // Email Field
                OtpInputField(controller: TextEditingController()),
                Space.height.betweenInputBox,

                Obx(
                  () => PrimaryButtonWidget(
                    isLoading: controller.isLoading.value,
                    title: Strings.sendConfirmation,
                    onPressed: () {
                      controller.otpVerifyProcess();
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

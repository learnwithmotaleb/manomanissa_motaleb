part of 'verification_screen.dart';

class VerificationScreenMobile extends GetView<VerificationController> {
  const VerificationScreenMobile({super.key});

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

                    PrimaryButtonWidget(
                      title: Strings.sendConfirmation,
                      onPressed: () {
                        Get.toNamed(Routes.profile_setupScreen);
                      },
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

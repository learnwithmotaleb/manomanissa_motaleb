part of 'confirm_screen.dart';

class ConfirmScreenMobile extends GetView<ConfirmController> {
  const ConfirmScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Confirm"),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              TextWidget(
                textAlign: TextAlign.center,
                Strings.gladToSeeYouAgain,
                fontSize: Dimensions.titleLarge,
              ),
              TextWidget(
                Strings.passwordChangedMessage,
                textAlign: TextAlign.center,

                fontSize: Dimensions.titleSmall,
              ),
              Space.height.v30,
              PrimaryButtonWidget(title: 'Continue', onPressed: () {
                Get.offAllNamed(Routes.loginScreen);
              },)

            ],
          ),
        ),
      ),
    );
  }
}

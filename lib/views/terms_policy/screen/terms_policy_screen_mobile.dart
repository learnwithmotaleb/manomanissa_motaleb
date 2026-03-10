part of 'terms_policy_screen.dart';

class TermsPolicyScreenMobile extends GetView<TermsPolicyController> {
  const TermsPolicyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Obx(
              () => controller.isLoading.value
              ? LoadingWidget()
              : controller.privacyDescription.isEmpty
              ? EmptyDataWidget()
              : ListView(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            children: [
              TextWidget(
                controller.privacyDescription,
                fontSize: Dimensions.titleSmall,
                color: CustomColors.grayShade,
              ),
            ],
          ),
        ),

      ),
    );
  }
}

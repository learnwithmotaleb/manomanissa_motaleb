part of 'terms_policy_screen.dart';

class TermsPolicyScreenMobile extends GetView<TermsPolicyController> {
  const TermsPolicyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: controller.appBarTitle),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : controller.privacyDescription.isEmpty
              ? EmptyDataWidget()
              : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                      sliver: SliverToBoxAdapter(
                        child: TextWidget(
                          controller.privacyDescription,
                          fontSize: Dimensions.titleSmall,
                          color: CustomColors.grayShade,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

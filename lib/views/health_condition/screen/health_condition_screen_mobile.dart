part of 'health_condition_screen.dart';

class HealthConditionScreenMobile extends GetView<HealthConditionController> {
  const HealthConditionScreenMobile({super.key});

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
                    Row(
                      mainAxisAlignment: mainCenter,
                      children: [
                        TextWidget(
                          Strings.healthCondition,
                          textAlign: TextAlign.center,
                          fontSize: Dimensions.titleLarge,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.whiteColor,
                        ),
                        TextWidget(
                          "(${Strings.optional})",
                          fontSize: Dimensions.bodyMedium,
                          color: CustomColors.whiteColor.withOpacity(0.6),
                        ),
                      ],
                    ),
                    Space.height.v30,
                    Obx(
                      () => Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: [
                          ...controller.healthConditions.map((condition) {
                            final isSelected = controller.selectedConditions
                                .contains(condition);
                            return GestureDetector(
                              onTap: () =>
                                  controller.toggleCondition(condition),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 3,
                                  ),
                                  border: Border.all(
                                    color: isSelected
                                        ? CustomColors.primary
                                        : CustomColors.primary.withOpacity(0.3),
                                    width: 1.4,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 250,
                                      ),
                                      width: 20.h,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? CustomColors.primary
                                              : CustomColors.primary
                                                    .withOpacity(0.4),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Icon(
                                              Icons.check,
                                              size: 12.h,
                                              color: CustomColors.primary,
                                            )
                                          : null,
                                    ),
                                    Space.width.v10,
                                    TextWidget(
                                      condition,
                                      fontSize: Dimensions.bodyMedium,
                                      color: CustomColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          // Add more chip
                          GestureDetector(
                            onTap: controller.showAddMoreDialog,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius * 3,
                                ),
                                border: Border.all(
                                  color: CustomColors.primary.withOpacity(0.3),
                                  width: 1.4,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: CustomColors.primary,
                                    size: 20.h,
                                  ),
                                  Space.width.v10,
                                  TextWidget(
                                    Strings.addMore,
                                    fontSize: Dimensions.bodyMedium,
                                    color: CustomColors.whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space.height.v30,
                    PrimaryButtonWidget(
                      title: Strings.update,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Space.height.v30,
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

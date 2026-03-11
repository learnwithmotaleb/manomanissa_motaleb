part of 'goal_screen_screen.dart';

class GoalScreenScreenMobile extends GetView<GoalScreenController> {
  const GoalScreenScreenMobile({super.key});

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
                      "Set your goal",
                      textAlign: TextAlign.center,
                      fontSize: Dimensions.titleLarge,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.whiteColor,
                    ),
                    Space.height.v5,
                    TextWidget(
                      "You can choose several",
                      textAlign: TextAlign.center,
                      fontSize: Dimensions.bodyMedium,
                      color: CustomColors.whiteColor.withOpacity(0.7),
                    ),
                    Space.height.v30,
                    Obx(
                      () => Column(
                        children: controller.goals.map((goal) {
                          final isSelected = controller.selectedGoals.contains(
                            goal,
                          );
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: Dimensions.spaceBetweenInputBox,
                            ),
                            child: GestureDetector(
                              onTap: () => controller.toggleGoal(goal),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.horizontalSize * 0.8,
                                  vertical: Dimensions.verticalSize * 0.7,
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
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 250,
                                      ),
                                      width: 22.h,
                                      height: 22.h,
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
                                              size: 14.h,
                                              color: CustomColors.primary,
                                            )
                                          : null,
                                    ),
                                    Space.width.v15,
                                    TextWidget(
                                      goal,
                                      fontSize: Dimensions.titleSmall,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Space.height.v25,
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

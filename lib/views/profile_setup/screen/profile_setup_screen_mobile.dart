part of 'profile_setup_screen.dart';

class ProfileSetupScreenMobile extends GetView<ProfileSetupController> {
  const ProfileSetupScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
          child: _buildStep(controller.currentStep.value),
        )),
      ),
    );
  }

  Widget _buildStep(int step) {
    switch (step) {
      case 0: return _StepOne(key: const ValueKey(0));
      case 1: return _StepTwo(key: const ValueKey(1));
      case 2: return _StepThree(key: const ValueKey(2));
      case 3: return _StepFour(key: const ValueKey(3));
      case 4: return _StepFive(key: const ValueKey(4));
      default: return _StepOne(key: const ValueKey(0));
    }
  }
}

// ─── Step Indicator ───────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  final int current;
  final int total;
  const _StepIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainCenter,
          children: List.generate(total, (index) {
            final isActive = index == current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: isActive ? 18.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: isActive
                    ? CustomColors.primary
                    : CustomColors.primary.withOpacity(0.3),
              ),
            );
          }),
        ),
        Space.height.v10,
        TextWidget(
          "${current + 1}/$total",
          fontSize: Dimensions.labelSmall,
          color: CustomColors.whiteColor.withOpacity(0.5),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ─── Step 1: Name & DOB ───────────────────────────────────
class _StepOne extends GetView<ProfileSetupController> {
  const _StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        Space.height.v100,
        TextWidget(
          Strings.setupProfile,
          textAlign: TextAlign.center,
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.w700,
          color: CustomColors.whiteColor,
        ),
        Space.height.betweenInputBox,
        Space.height.betweenInputBox,
        PrimaryInputFieldWidget(
          prefixIcon: Icon(Icons.person, color: CustomColors.primary),
          controller: controller.nameController,
          hintText: Strings.enterYourName,
        ),
        Space.height.betweenInputBox,
        DatePickerWidget(
          hint: "Select Date",
          onDateSelected: (date) => controller.selectedDate.value = date,
        ),
        Space.height.v25,
        PrimaryButtonWidget(
          title: Strings.continues,
          onPressed: controller.goToNextStep,
        ),
        Space.height.v30,
        _StepIndicator(current: 0, total: 5),
      ],
    );
  }
}

// ─── Step 2: Goals ────────────────────────────────────────
class _StepTwo extends GetView<ProfileSetupController> {
  const _StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
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
        Obx(() => Column(
          children: controller.goals.map((goal) {
            final isSelected = controller.selectedGoals.contains(goal);
            return Padding(
              padding: EdgeInsets.only(bottom: Dimensions.spaceBetweenInputBox),
              child: GestureDetector(
                onTap: () => controller.toggleGoal(goal),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize * 0.8,
                    vertical: Dimensions.verticalSize * 0.7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
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
                        duration: const Duration(milliseconds: 250),
                        width: 22.h,
                        height: 22.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? CustomColors.primary
                                : CustomColors.primary.withOpacity(0.4),
                            width: 1.5,
                          ),
                        ),
                        child: isSelected
                            ? Icon(Icons.check, size: 14.h, color: CustomColors.primary)
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
        )),
        Space.height.v25,
        PrimaryButtonWidget(
          title: Strings.continues,
          onPressed: controller.onGoalContinue,
        ),
        Space.height.v30,
        _StepIndicator(current: 1, total: 5),
      ],
    );
  }
}

// ─── Step 3: Health Conditions ────────────────────────────
class _StepThree extends GetView<ProfileSetupController> {
  const _StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        Space.height.v100,
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TextWidget(
              "Health Conditions ",
              textAlign: TextAlign.center,
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.w700,
              color: CustomColors.whiteColor,
            ),
            TextWidget(
              "(optional)",
              fontSize: Dimensions.bodyMedium,
              color: CustomColors.whiteColor.withOpacity(0.6),
            ),
          ],
        ),
        Space.height.v30,
        Obx(() => Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            ...controller.healthConditions.map((condition) {
              final isSelected = controller.selectedConditions.contains(condition);
              return GestureDetector(
                onTap: () => controller.toggleCondition(condition),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
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
                        duration: const Duration(milliseconds: 250),
                        width: 20.h,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? CustomColors.primary
                                : CustomColors.primary.withOpacity(0.4),
                            width: 1.5,
                          ),
                        ),
                        child: isSelected
                            ? Icon(Icons.check, size: 12.h, color: CustomColors.primary)
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 3),
                  border: Border.all(
                    color: CustomColors.primary.withOpacity(0.3),
                    width: 1.4,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_circle_outline,
                        color: CustomColors.primary, size: 20.h),
                    Space.width.v10,
                    TextWidget(
                      "Add more",
                      fontSize: Dimensions.bodyMedium,
                      color: CustomColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        Space.height.v30,
        PrimaryButtonWidget(
          title: Strings.continues,
          onPressed: controller.onConditionContinue,
        ),
        Space.height.v30,
        _StepIndicator(current: 2, total: 5),
      ],
    );
  }
}

// ─── Step 4: Choose Character ─────────────────────────────
class _StepFour extends GetView<ProfileSetupController> {
  const _StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        Space.height.v100,
        TextWidget(
          "Choose your Character",
          textAlign: TextAlign.center,
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.w700,
          color: CustomColors.whiteColor,
        ),
        Space.height.v30,
        Obx(() => Row(
          children: [
            // Female
            Expanded(
              child: GestureDetector(
                onTap: () => controller.selectCharacter('female'),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
                    border: Border.all(
                      color: controller.selectedCharacter.value == 'female'
                          ? CustomColors.primary
                          : CustomColors.primary.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      TextWidget(
                        "Female",
                        color: CustomColors.primary,
                        fontSize: Dimensions.titleSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      Space.height.v10,
                      Image.asset(
                        Assets.dummy.female.path,
                        height: 200.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Space.width.v15,
            // Male
            Expanded(
              child: GestureDetector(
                onTap: () => controller.selectCharacter('male'),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
                    border: Border.all(
                      color: controller.selectedCharacter.value == 'male'
                          ? CustomColors.primary
                          : CustomColors.primary.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      TextWidget(
                        "Male",
                        color: CustomColors.primary,
                        fontSize: Dimensions.titleSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      Space.height.v10,
                      Image.asset(
                        Assets.dummy.male.path,
                        height: 200.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        Space.height.v30,
        PrimaryButtonWidget(
          title: Strings.continues,
          onPressed: controller.onCharacterContinue,
        ),
        Space.height.v30,
        _StepIndicator(current: 3, total: 5),
      ],
    );
  }
}

// ─── Step 5: Height & Weight ──────────────────────────────
class _StepFive extends GetView<ProfileSetupController> {
  const _StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space.height.v100,
        TextWidget(
          "Height & Weight",
          textAlign: TextAlign.center,
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.w700,
          color: CustomColors.whiteColor,
        ),
        Space.height.v30,
        Expanded(
          child: Padding(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            child: Row(
              children: [
                // Height Picker
                Expanded(
                  child: Column(
                    children: [
                      TextWidget(
                        "Height",
                        fontSize: Dimensions.titleSmall,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.whiteColor,
                      ),
                      Space.height.v15,
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: controller.heightScrollController,
                          itemExtent: 48.h,
                          perspective: 0.003,
                          diameterRatio: 2.5,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            controller.selectedHeight.value =
                            controller.heights[index];
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              if (index < 0 ||
                                  index >= controller.heights.length) {
                                return null;
                              }
                              return Obx(() {
                                final isSelected =
                                    controller.heights[index] ==
                                        controller.selectedHeight.value;
                                return Center(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: isSelected
                                        ? BoxDecoration(
                                      color: CustomColors.blackColor,
                                      borderRadius:
                                      BorderRadius.circular(
                                          Dimensions.radius),
                                    )
                                        : null,
                                    child: TextWidget(
                                      "${controller.heights[index]} cm",
                                      fontSize: isSelected
                                          ? Dimensions.titleSmall
                                          : Dimensions.bodyMedium,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                      color: isSelected
                                          ? CustomColors.whiteColor
                                          : CustomColors.whiteColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                );
                              });
                            },
                            childCount: controller.heights.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Weight Picker
                Expanded(
                  child: Column(
                    children: [
                      TextWidget(
                        "Weight",
                        fontSize: Dimensions.titleSmall,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.whiteColor,
                      ),
                      Space.height.v15,
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: controller.weightScrollController,
                          itemExtent: 48.h,
                          perspective: 0.003,
                          diameterRatio: 2.5,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            controller.selectedWeight.value =
                            controller.weights[index];
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              if (index < 0 ||
                                  index >= controller.weights.length) {
                                return null;
                              }
                              return Obx(() {
                                final isSelected =
                                    controller.weights[index] ==
                                        controller.selectedWeight.value;
                                return Center(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: isSelected
                                        ? BoxDecoration(
                                      color: CustomColors.blackColor,
                                      borderRadius:
                                      BorderRadius.circular(
                                          Dimensions.radius),
                                    )
                                        : null,
                                    child: TextWidget(
                                      "${controller.weights[index]} kg",
                                      fontSize: isSelected
                                          ? Dimensions.titleSmall
                                          : Dimensions.bodyMedium,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                      color: isSelected
                                          ? CustomColors.whiteColor
                                          : CustomColors.whiteColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                );
                              });
                            },
                            childCount: controller.weights.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              PrimaryButtonWidget(
                title: Strings.continues,
                onPressed: controller.onFinalContinue,
              ),
              Space.height.v30,
              _StepIndicator(current: 4, total: 5),
              Space.height.v20,
            ],
          ),
        ),
      ],
    );
  }
}
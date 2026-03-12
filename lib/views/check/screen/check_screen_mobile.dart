part of 'check_screen.dart';

class CheckScreenMobile extends GetView<CheckController> {
  const CheckScreenMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Space.height.v20,

                      BlurWidget(
                        blurAmount: 2,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius * 1.5,
                            ),
                            color: Colors.black.withOpacity(0.4),
                            border: Border.all(
                              color: const Color(0xFF039CE0).withOpacity(0.2),
                              width: 1.2,
                            ),
                          ),
                          child: TextWidget(
                            Strings.todaysScore,
                            fontSize: Dimensions.titleSmall,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.whiteColor,
                          ),
                        ),
                      ),
                      Space.height.v20,

                      // ─── Sleep ─────────────────────────────────
                      CheckSliderWidget(
                        icon: Icon(
                          Icons.bedtime,
                          color: CustomColors.primary,
                          size: 20.h,
                        ),
                        label: Strings.sleep,
                        valueLabel:
                            "${controller.sleepValue.value.toStringAsFixed(1)}h 45m",
                        minLabel: Strings.oHour,
                        maxLabel: Strings.twelveHours,
                        value: controller.sleepValue.value,
                        min: 0,
                        max: 12,
                        onChanged: (v) => controller.sleepValue.value = v,
                      ),
                      Space.height.v15,

                      // ─── Hydration ─────────────────────────────
                      CheckSliderWidget(
                        icon: Icon(
                          Icons.water_drop_rounded,
                          color: Colors.lightBlueAccent,
                          size: 20.h,
                        ),
                        label: Strings.hydration,
                        valueLabel:
                            "${controller.hydrationValue.value.toStringAsFixed(1)} Liters",
                        minLabel: Strings.oVerres,
                        maxLabel: Strings.fiveLitres,
                        value: controller.hydrationValue.value,
                        min: 0,
                        max: 5,
                        onChanged: (v) => controller.hydrationValue.value = v,
                      ),
                      Space.height.v15,

                      // ─── Activity ──────────────────────────────
                      CheckSliderWidget(
                        icon: Icon(
                          Icons.directions_walk,
                          color: Colors.lightBlueAccent,
                          size: 20.h,
                        ),
                        label: Strings.activity,
                        valueLabel:
                            "${controller.activityValue.value.toInt()} Steps",
                        minLabel: Strings.oSteps,
                        maxLabel: Strings.fifteenThousandSteps,
                        value: controller.activityValue.value,
                        min: 0,
                        max: 15000,
                        onChanged: (v) => controller.activityValue.value = v,
                      ),
                      Space.height.v15,

                      // ─── Nutrition ─────────────────────────────
                      CheckSliderWidget(
                        icon: Image.asset(
                          Assets.icons.orange.path,
                          height: 20.h,
                        ),
                        label: Strings.nutrition,
                        valueLabel:
                            "${controller.nutritionValue.value.toInt()} Cal",
                        minLabel: Strings.oCal,
                        maxLabel: Strings.threeThousandCal,
                        value: controller.nutritionValue.value,
                        min: 0,
                        max: 3000,
                        activeGradient: const LinearGradient(
                          colors: [Color(0xFFF36800), Color(0xFFFCD78D)],
                        ),
                        onChanged: (v) => controller.nutritionValue.value = v,
                      ),
                      Space.height.v30,

                      // ─── Confirm Button ────────────────────────
                      Obx(() => GlowOutlineButton(
                        title: Strings.confirm,
                        isLoading: controller.isLoading.value,
                        onPressed: controller.isLoading.value ? () {} : controller.onConfirm,
                      )),
                      Space.height.v30,
                    ],
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

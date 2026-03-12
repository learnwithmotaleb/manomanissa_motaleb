part of 'update_profile_screen.dart';

class UpdateProfileScreenMobile extends GetView<UpdateProfileController> {
  const UpdateProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Obx(
          () => controller.isFetching.value
              ? LoadingWidget()
              : Padding(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  child: Column(
                    children: [
                      Space.height.v100,

                      // ─── Title ──────────────────────────────────
                      TextWidget(
                        Strings.editProfile2,
                        fontSize: Dimensions.headlineSmall,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.whiteColor,
                        textAlign: TextAlign.center,
                      ),
                      Space.height.v30,

                      // ─── Name Field ─────────────────────────────
                      PrimaryInputFieldWidget(
                        controller: controller.nameController,
                        hintText: Strings.enterYourName,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: CustomColors.primary,
                        ),
                      ),
                      Space.height.v15,

                      // ─── Date of Birth ──────────────────────────
                      GestureDetector(
                        onTap: controller.onPickDate,
                        child: BlurWidget(
                          blurAmount: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius * 3,
                              ),
                              color: Colors.black.withOpacity(0.35),
                              border: Border.all(
                                color: CustomColors.primary.withOpacity(0.25),
                                width: 1.4,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: CustomColors.primary,
                                  size: 20.h,
                                ),
                                Space.width.v15,
                                Expanded(
                                  child: Obx(
                                    () => TextWidget(
                                      controller.selectedDate.value == null
                                          ? "10 June 2002"
                                          : controller.formattedDate,
                                      fontSize: Dimensions.titleSmall,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.whiteColor,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: CustomColors.primary,
                                  size: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space.height.v15,

                      // ─── Gender ─────────────────────────────────
                      GestureDetector(
                        onTap: controller.onPickGender,
                        child: BlurWidget(
                          blurAmount: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius * 3,
                              ),
                              color: Colors.black.withOpacity(0.35),
                              border: Border.all(
                                color: CustomColors.primary.withOpacity(0.25),
                                width: 1.4,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.female,
                                  color: CustomColors.primary,
                                  size: 20.h,
                                ),
                                Space.width.v15,
                                Expanded(
                                  child: Obx(
                                    () => TextWidget(
                                      controller.selectedGender.value.isEmpty
                                          ? Strings.gender
                                          : controller.selectedGender.value,
                                      fontSize: Dimensions.titleSmall,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.whiteColor,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: CustomColors.primary,
                                  size: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space.height.v30,

                      Obx(
                        () => GlowOutlineButton(
                          title: Strings.updateProfile,
                          onPressed: controller.isLoading.value
                              ? () {}
                              : controller.onUpdate,
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

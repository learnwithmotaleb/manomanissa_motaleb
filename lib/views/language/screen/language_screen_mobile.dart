part of 'language_screen.dart';

class LanguageScreenMobile extends GetView<LanguageController> {
  const LanguageScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              Space.height.v100,
              TextWidget(
                Strings.languageLangue,
                fontSize: Dimensions.headlineSmall,
                fontWeight: FontWeight.w600,
                color: CustomColors.whiteColor,
                textAlign: TextAlign.center,
              ),
              Space.height.v30,

              // ─── Language Options ───────────────────────
              Obx(() => Column(
                children: controller.languages.map((lang) {
                  final isSelected = controller.selectedLanguage.value == lang['code'];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: GestureDetector(
                      onTap: () => controller.selectLanguage(lang['code']!),
                      child: BlurWidget(
                        blurAmount: 2,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius * 3),
                            color: Colors.black.withOpacity(0.35),
                            border: Border.all(
                              color: isSelected
                                  ? CustomColors.primary
                                  : CustomColors.primary.withOpacity(0.25),
                              width: 1.4,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                lang['flag']!,
                                height: 24.h,
                                width: 24.h,
                              ),
                              Space.width.v15,
                              Expanded(
                                child: TextWidget(
                                  lang['name']!,
                                  fontSize: Dimensions.titleSmall,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.whiteColor,
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: 22.h,
                                height: 22.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? CustomColors.primary
                                        : CustomColors.primary.withOpacity(0.3),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),

              Space.height.v25,

              // ─── Continue Button ────────────────────────
              GlowOutlineButton(
                title: Strings.continues,
                onPressed: controller.onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
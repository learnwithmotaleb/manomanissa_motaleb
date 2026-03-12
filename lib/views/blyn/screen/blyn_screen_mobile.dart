part of 'blyn_screen.dart';

class BlynScreenMobile extends GetView<BlynController> {
  const BlynScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
               SliverToBoxAdapter(child:  Space.height.v40,),
                SliverPadding(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  sliver: Obx(() => controller.isLoading.value
                      ? SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(color: CustomColors.primary),
                    ),
                  )
                      : SliverList.builder(
                    itemCount: controller.faqList.length,
                    itemBuilder: (context, index) {
                      final faq = controller.faqList[index];
                      return RepaintBoundary(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: GestureDetector(
                            onTap: () => _showFaqPopup(context, faq.question, faq.answer),
                            child: BlurWidget(
                              blurAmount: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius * 3),
                                  color: Colors.black.withOpacity(0.35),
                                  border: Border.all(
                                    color: CustomColors.primary.withOpacity(0.25),
                                    width: 1.2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.getIcon(index),
                                      color: CustomColors.primary,
                                      size: 20.h,
                                    ),
                                    Space.width.v15,
                                    Expanded(
                                      child: TextWidget(
                                        faq.question,
                                        fontSize: Dimensions.bodyMedium,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.whiteColor,
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
                        ),
                      );
                    },
                  )),
                ),
              ],
            ),

            Positioned(
              bottom: 20.h,
              left: Dimensions.horizontalSize,
              right: Dimensions.horizontalSize,
              child: GlowOutlineButton(
                title: "${Strings.askAiAssistantBlyn.tr}  →",
                onPressed: () => Get.toNamed(Routes.ai_chatScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showFaqPopup(BuildContext context, String question, String answer) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            color: const Color(0xFF0D1B2A),
            border: Border.all(
              color: CustomColors.primary.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossStart,
            children: [
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  Expanded(
                    child: TextWidget(
                      question,
                      fontSize: Dimensions.titleSmall,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomColors.primary.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.close, color: CustomColors.primary, size: 16.h),
                    ),
                  ),
                ],
              ),
              Space.height.v20,
              TextWidget(
                answer,
                fontSize: Dimensions.bodyMedium,
                fontWeight: FontWeight.w400,
                color: CustomColors.whiteColor.withOpacity(0.85),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── FAQ Tile ─────────────────────────────────────────────

part of 'questions_screen.dart';

class QuestionsScreenMobile extends GetView<QuestionsController> {
  const QuestionsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Strings.faqs),
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          cacheExtent: 500,
          slivers: [
            SliverToBoxAdapter(child: Space.height.v30),

            SliverPadding(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              sliver: SliverList.builder(
                itemCount: controller.faqList.length,
                itemBuilder: (context, index) {
                  final faq = controller.faqList[index];
                  return RepaintBoundary(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: GestureDetector(
                        onTap: () => _showAnswerPopup(
                          context,
                          faq['question']!,
                          faq['answer']!,
                        ),
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
                                width: 1.2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  controller.faqIcons[index],
                                  color: CustomColors.primary,
                                  size: 20.h,
                                ),
                                Space.width.v15,
                                Expanded(
                                  child: TextWidget(
                                    faq['question']!,
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
              ),
            ),
            SliverToBoxAdapter(child: Space.height.v30),
          ],
        ),
      ),
    );
  }

  void _showAnswerPopup(BuildContext context, String question, String answer) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlurWidget(
          blurAmount: 10,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              color: Colors.black.withOpacity(0.6),
              border: Border.all(
                color: CustomColors.primary.withOpacity(0.3),
                width: 1.2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossStart,
              children: [
                // ─── Header ─────────────────────────────
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  crossAxisAlignment: crossStart,
                  children: [
                    Expanded(
                      child: TextWidget(
                        question,
                        fontSize: Dimensions.titleSmall,
                        fontWeight: FontWeight.w700,
                        color: CustomColors.primary,
                      ),
                    ),
                    Space.width.v10,
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomColors.primary.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: CustomColors.primary,
                          size: 16.h,
                        ),
                      ),
                    ),
                  ],
                ),
                Space.height.v20,

                // ─── Answer ──────────────────────────────
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
      ),
    );
  }
}
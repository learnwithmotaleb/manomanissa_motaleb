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
                SliverPadding(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Space.height.v20,
                        Row(
                          children: [
                            TextWidget(
                              "${Strings.aiAssistant} ",
                              fontSize: Dimensions.headlineSmall,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.whiteColor,
                            ),
                            TextWidget(
                              Strings.blyn,
                              fontSize: Dimensions.headlineSmall,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.primary,
                            ),
                          ],
                        ),
                        Space.height.v30,

                        ...controller.faqList.asMap().entries.map((entry) {
                          final index = entry.key;
                          final faq = entry.value;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: _FaqTile(
                              question: faq['question']!,
                              answer: faq['answer']!,
                              icon: controller.faqIcons[index],
                            ),
                          );
                        }),

                        Space.height.v100,
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 20.h,
              left: Dimensions.horizontalSize,
              right: Dimensions.horizontalSize,
              child: GlowOutlineButton(
                title: "${Strings.askAiAssistantBlyn}  →",
                onPressed: () => Get.toNamed(Routes.ai_chatScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── FAQ Tile ─────────────────────────────────────────────
class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  final IconData icon;

  const _FaqTile({
    required this.question,
    required this.answer,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAnswerPopup(context, question, answer),
      child: BlurWidget(
        blurAmount: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
              Icon(icon, color: CustomColors.primary, size: 20.h),
              Space.width.v15,
              Expanded(
                child: TextWidget(
                  question,
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
    );
  }

  void _showAnswerPopup(BuildContext context, String question, String answer) {
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
              // ─── Header ───────────────────────────────
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

              // ─── Answer ───────────────────────────────
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

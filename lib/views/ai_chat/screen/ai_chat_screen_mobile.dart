part of 'ai_chat_screen.dart';

class AiChatScreenMobile extends GetView<AiChatController> {
  const AiChatScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _HistoryDrawer(),
      body: SafeArea(
        child: Builder(
          builder: (context) => Column(
            children: [
              Padding(
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                child: Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomColors.primary,
                            width: 1.5,
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: CustomColors.primary,
                          size: 16.h,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: controller.onNewChat,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius * 3,
                          ),
                          border: Border.all(
                            color: CustomColors.primary,
                            width: 1.5,
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Row(
                          children: [
                            TextWidget(
                              Strings.newChat,
                              fontSize: Dimensions.bodyMedium,
                              color: CustomColors.whiteColor,
                            ),
                            Space.width.v5,
                            Icon(
                              Icons.add_circle_outline,
                              color: CustomColors.primary,
                              size: 18.h,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Menu Button — drawer open করবে
                    GestureDetector(
                      onTap: () => Scaffold.of(context).openEndDrawer(),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomColors.primary,
                            width: 1.5,
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: CustomColors.primary,
                          size: 18.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Obx(
                  () => controller.messages.isEmpty
                      ? Column(
                          children: [
                            Space.height.v100,
                            Row(
                              children: [
                                Padding(
                                  padding: Dimensions
                                      .defaultHorizontalSize
                                      .edgeHorizontal,
                                  child: Image.asset(Assets.dummy.welcom.path),
                                ),
                              ],
                            ),
                          ],
                        )
                      : CustomScrollView(
                          controller: controller.scrollController,
                          slivers: [
                            SliverPadding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.horizontalSize,
                                vertical: 10.h,
                              ),
                              sliver: SliverList.builder(
                                itemCount: controller.messages.length,
                                itemBuilder: (context, index) {
                                  final msg = controller.messages[index];
                                  return _ChatBubble(
                                    message: msg['text']!,
                                    isUser: msg['isUser'] == 'true',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalSize,
                  vertical: 16.h,
                ),
                child: BlurWidget(
                  blurAmount: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 3,
                      ),
                      color: Colors.black.withOpacity(0.45),
                      border: Border.all(
                        color: CustomColors.primary.withOpacity(0.4),
                        width: 1.4,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.inputController,
                            style: TextStyle(
                              color: CustomColors.whiteColor,
                              fontSize: Dimensions.bodyMedium,
                            ),
                            cursorColor: CustomColors.primary,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Strings.aksBlyn,
                              hintStyle: TextStyle(
                                color: CustomColors.whiteColor.withOpacity(0.4),
                                fontSize: Dimensions.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.isSending.value ? null : controller.onSend,
                          child: Obx(() => Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CustomColors.primary, width: 1.5),
                              color: controller.isSending.value
                                  ? CustomColors.primary.withOpacity(0.3)
                                  : Colors.transparent,
                            ),
                            child: controller.isSending.value
                                ? SizedBox(
                              width: 18.h,
                              height: 18.h,
                              child: CircularProgressIndicator(
                                color: CustomColors.primary,
                                strokeWidth: 2,
                              ),
                            )
                                : Icon(Icons.arrow_upward, color: CustomColors.primary, size: 18.h),
                          )),
                        ),
                      ],
                    ),
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

// ─── History Drawer ───────────────────────────────────────
class _HistoryDrawer extends GetView<AiChatController> {
  const _HistoryDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      backgroundColor: const Color(0xFF050D18),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize,
                vertical: 16.h,
              ),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius * 3,
                        ),
                        border: Border.all(
                          color: CustomColors.primary.withOpacity(0.4),
                          width: 1.4,
                        ),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.searchController,
                              style: TextStyle(
                                color: CustomColors.whiteColor,
                                fontSize: Dimensions.bodyMedium,
                              ),
                              cursorColor: CustomColors.primary,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: CustomColors.whiteColor.withOpacity(
                                    0.4,
                                  ),
                                  fontSize: Dimensions.bodyMedium,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            color: CustomColors.primary,
                            size: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Space.width.v10,

                  // Close Button
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomColors.primary.withOpacity(0.4),
                          width: 1.4,
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: CustomColors.whiteColor,
                        size: 18.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ─── History Title ────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize,
              ),
              child: TextWidget(
                "History",
                fontSize: Dimensions.titleMedium,
                fontWeight: FontWeight.w700,
                color: CustomColors.whiteColor,
              ),
            ),
            Space.height.v15,

            // ─── History List ─────────────────────────────
            Expanded(
              child: Obx(
                () => CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.horizontalSize,
                      ),
                      sliver: SliverList.builder(
                        itemCount: controller.filteredHistory.length,
                        itemBuilder: (context, index) {
                          final conv = controller.filteredHistory[index];
                          return GestureDetector(
                            onTap: () => controller.loadHistory(conv),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 18.h),
                              child: TextWidget(
                                conv.question,
                                fontSize: Dimensions.bodyMedium,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.whiteColor.withOpacity(0.85),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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

// ─── Chat Bubble ──────────────────────────────────────────
class _ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const _ChatBubble({required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
          color: isUser
              ? CustomColors.primary.withOpacity(0.2)
              : Colors.black.withOpacity(0.4),
          border: Border.all(
            color: CustomColors.primary.withOpacity(0.3),
            width: 1.2,
          ),
        ),
        child: TextWidget(
          message,
          fontSize: Dimensions.bodyMedium,
          color: CustomColors.whiteColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

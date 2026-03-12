part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Notifications"),
      body: Obx(() => controller.isLoading.value ? LoadingWidget() : SafeArea(
        child: CustomScrollView(
          cacheExtent: 500,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //
            //       Container(height: 100,color: Colors.orange,)
            //
            //     ],
            //   ),
            // ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              sliver: controller.notificationsList.isEmpty
                  ? SliverFillRemaining(
                child: Center(
                  child: TextWidget(
                    "No notifications yet",
                    color: CustomColors.whiteColor.withOpacity(0.5),
                    fontSize: Dimensions.titleSmall,
                  ),
                ),
              )
                  : SliverList.builder(
                itemCount: controller.notificationsList.length,
                itemBuilder: (context, index) {
                  return RepaintBoundary(
                    child: _NotificationCard(
                      title: controller.notificationsList[index].message,
                      key: ValueKey(index),
                    ),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(child: Space.height.v30),
          ],
        ),
      ),)
    );
  }
}

// ─── Extracted widget — rebuild কমাবে ─────────────────────
class _NotificationCard extends GetView<NotificationController> {
  final String title;
  const _NotificationCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.25),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize * 0.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: Colors.black.withOpacity(0.45),
        border: Border.all(
          color: CustomColors.primary.withOpacity(0.25),
          width: 1.5,
        ),
      ),
      child: TextWidget(
        title, 
        fontSize: Dimensions.titleSmall,
        maxLines: 2,
      ),
    );
  }
}
part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Notification"),
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
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
              sliver: SliverList.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return RepaintBoundary(
                    child: _NotificationCard(
                      key: ValueKey(index),
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
}

// ─── Extracted widget — rebuild কমাবে ─────────────────────
class _NotificationCard extends StatelessWidget {
  const _NotificationCard({super.key});

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
        'A few conscious choices today can make all the difference A few conscious choices today can make all the difference',
        fontSize: Dimensions.titleSmall,
        maxLines: 2,
      ),
    );
  }
}
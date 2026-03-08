part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Notification"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          addRepaintBoundaries: true,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize),
          cacheExtent: 500,
          physics: BouncingScrollPhysics(),

          itemBuilder: (context, index) {
          return  Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.25),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.verticalSize * 0.5
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius   ,
              ),
              color: Colors.black.withOpacity(0.45),
              border: Border.all(
                color: CustomColors.primary.withOpacity(0.25),
                width: 1.5,
              ),
            ),
            child: TextWidget(
              'A few conscious choices today can make all the difference A few conscious choices today can make all the difference',
              fontSize: Dimensions.titleSmall ,
              maxLines: 2,
            ),
          );
        },)
      ),
    );
  }
}

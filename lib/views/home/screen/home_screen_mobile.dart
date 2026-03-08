part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.dummy.frame.path, fit: BoxFit.cover),
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverPadding(
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Space.height.v40,
                    Space.height.v5,
                    HomeHeaderWidget(),
                    Space.height.v20,
                 Row(
                   mainAxisAlignment: mainSpaceBet,
                   children: [
                   _share(),
                   SizedBox()
                 ],),
                    Space.height.v40,
                    HomeInfoCard(),
                    Space.height.v30,
                    BlurWidget(
                      blurAmount: 1.1,
                      child: Container(
                        alignment: Alignment.center,
                        height: 45.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.defaultHorizontalSize,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.defaultHorizontalSize * 2.5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius * 4,
                          ),
                          color: Colors.black.withOpacity(0.45),
                          border: Border.all(
                            color: CustomColors.primary.withOpacity(0.25),
                            width: 1.5,
                          ),
                        ),
                        child: TextWidget(
                          Strings.yourBonusLevel,
                          fontSize: Dimensions.titleSmall,
                        ),
                      ),
                    ),
                    Space.height.v20,
                    ProgressionWidget(),
                    Space.height.v40,
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _share() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 3),
          color: Colors.black.withOpacity(0.35),
          border: Border.all(
            color: CustomColors.primary.withOpacity(0.4),
            width: 1.4.sp,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.share, color: CustomColors.primary),
            Space.width.v5,
            TextWidget(Strings.share),
          ],
        ),
      ),
    );
  }
}
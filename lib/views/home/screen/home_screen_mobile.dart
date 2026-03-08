part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

          Padding(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            child: Column(
              crossAxisAlignment: crossStart,
              // physics: const BouncingScrollPhysics(),
              children: [
                Space.height.v40,
                Space.height.v5,
                HomeHeaderWidget(),
                Space.height.v20,
                Container(
                  width: 120.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 3),
                    color: Colors.black.withOpacity(0.35),
                    border: Border.all(
                      color: CustomColors.primary.withOpacity(0.4),
                      width: 1.4.sp,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: mainMin,
                    children: [
                      Icon(Icons.share, color: CustomColors.primary),
                      Space.width.v5,
                      TextWidget('Share'),
                    ],
                  ),
                ),
                Space.height.v40,

                SizedBox(
                  height: size.height * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: size.height * 0.00,
                        bottom: 5,
                        child: Image.asset(
                          Assets.dummy.aann.path,
                          height: size.height * 0.40,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Positioned(
                        bottom: size.height * 0.12,
                        left: 0,
                        child: SizedBox(
                          width: size.width * 0.38,
                          child: BlurWidget(
                            blurAmount: 1.3,
                            child: StatCardWidget(
                              label: Strings.sleep,
                              value: "7h 45m",
                              target: "/8h",
                              progress: 0.6,
                              progressGradient: const LinearGradient(
                                colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                                stops: [0.0, 1.0],
                              ),
                              icon: Icon(
                                Icons.bedtime,
                                color: CustomColors.primary,
                                size: 18.h,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: size.height * 0.12,
                        right: 0,
                        child: SizedBox(
                          width: size.width * 0.38,
                          child: BlurWidget(
                            blurAmount: 1.3,
                            child: StatCardWidget(
                              label: Strings.hydration,
                              value: "2.5L",
                              target: "/3 Liters",
                              progress: 0.5,
                              progressGradient: const LinearGradient(
                                colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                                stops: [0.0, 1.0],
                              ),
                              icon: Icon(
                                Icons.water_drop_rounded,
                                color: Colors.lightBlueAccent,
                                size: 18.h,
                              ),
                              progressColor: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: size.height * 0.00,
                        left: 0,
                        child: SizedBox(
                          width: size.width * 0.38,
                          child: BlurWidget(
                            blurAmount: 1.3,
                            child: StatCardWidget(
                              label: Strings.activity,
                              value: "4230",
                              target: "/6000 steps",
                              progress: 0.85,
                              progressGradient: const LinearGradient(
                                colors: [Color(0xFF039CE0), Color(0xFFA4F4FE)],
                                stops: [0.0, 1.0],
                              ),
                              icon: Icon(
                                Icons.directions_walk,
                                color: Colors.lightBlueAccent,
                                size: 22.h,
                              ),
                              progressColor: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: size.height * 0.00,
                        right: 0,
                        child: SizedBox(
                          width: size.width * 0.38,
                          child: BlurWidget(
                            blurAmount: 1.3,
                            child: StatCardWidget(
                              label: Strings.nutrition,
                              value: "1400",
                              target: "/2500 Cal",
                              progress: 0.80,
                              progressGradient: const LinearGradient(
                                colors: [
                                  Color(0xFFF36800),
                                  Color(0xFFFCD78D),
                                  Color(0xFFFFFFFF),
                                ],
                              ),
                              icon: Image.asset(Assets.icons.orange.path),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

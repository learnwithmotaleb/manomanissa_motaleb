part of 'welcome_screen.dart';

class WelcomeScreenMobile extends GetView<WelcomeController> {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize * 0.9,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    SizedBox(),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        Dimensions.radius * 2,
                      ),
                      child: BlurWidget(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.5,
                              color: CustomColors.borderDark,
                            ),
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius * 2,
                            ),
                          ),
                          height: 50.h,
                          width: 140.w,
                          child: Wrap(
                            spacing: 10.w,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(Assets.icons.group.path),
                              TextWidget(Strings.french),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Space.height.v100,
                Space.height.v100,
                Space.height.v30,
                TextWidget(
                  Strings.welcomeTitle,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.titleLarge,
                ),
                Space.height.v5,
                TextWidget(
                  Strings.welcomeDescription,
                  textAlign: TextAlign.center,
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  fontSize: Dimensions.titleSmall,
                ),
                Space.height.v15,

                PrimaryButtonWidget(
                  title: Strings.logIn,
                  onPressed: () => Get.toNamed(Routes.loginScreen),
                ),
                PrimaryButtonWidget(
                  title: Strings.createAnAccount,
                  onPressed: () {
                    Get.toNamed(Routes.registerScreen);
                  },
                ),

                Space.height.v40,

                Wrap(
                  spacing: 8.w,

                  children: [
                    Image.asset(Assets.icons.q.path),
                    TextWidget(
                      Strings.frequentlyAskedQuestions,
                      color: CustomColors.primaryTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlurWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double blurAmount;
  final Color overlayColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const BlurWidget({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.blurAmount = 10,
    this.overlayColor = Colors.transparent,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (blurAmount <= 0) {
      return Container(
        width: width,
        height: height,
        padding: padding,
        color: overlayColor,
        child: child,
      );
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(Dimensions.radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          color: overlayColor,
          child: child,
        ),
      ),
    );
  }
}

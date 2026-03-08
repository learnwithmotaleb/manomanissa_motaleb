part of 'welcome_screen.dart';

class WelcomeScreenMobile extends GetView<WelcomeController> {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Welcome"),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize,),
            child: Column(
              mainAxisAlignment: mainCenter,
              children: [
                // TextWidget(
                //   'Welcome to\nHealth Genius',
                //   textAlign: TextAlign.center,
                //   fontSize: Dimensions.titleLarge,
                // ),
                // Space.height.v5,
                // TextWidget(
                //   'Improve your daily file with simple goals and Avatar that evolves with you',
                //   textAlign: TextAlign.center,
                //   padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                //   fontSize: Dimensions.titleSmall,
                // ),
                //
                // GlowOutlineButton(title: 'Log in', onPressed: () {}),
                //
                // Image.asset(Assets.dummy.frame2147229116Png.path),

                HistoryChartWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// history_chart_widget.dart


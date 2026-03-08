part of 'navigation_screen.dart';

class NavigationScreenMobile extends GetView<NavigationController> {
  const NavigationScreenMobile({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    CheckScreen(),
    BlynScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          backgroundColor: const Color(0xFF0A0E1A),
          selectedItemColor: CustomColors.primary,
          unselectedItemColor: CustomColors.whiteColor.withOpacity(0.4),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: Dimensions.labelSmall,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: Dimensions.labelSmall,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.whiteColor.withOpacity(0.4),
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.home1Neaticons.path),
              ),
              activeIcon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.primary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.home1Neaticons.path),
              ),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.whiteColor.withOpacity(0.4),
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.chatCheck.path),
              ),
              activeIcon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.primary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.chatCheck.path),
              ),
              label: Strings.checkIn,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.whiteColor.withOpacity(0.4),
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.ai1.path),
              ),
              activeIcon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.primary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.ai1.path),
              ),
              label: Strings.blyn,
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.whiteColor.withOpacity(0.4),
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.frame.path),
              ),
              activeIcon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  CustomColors.primary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(Assets.icons.frame.path),
              ),
              label: Strings.settings,
            ),
          ],
        ),
      ),
      body: Obx(() => _pages[controller.currentIndex.value]),
    );
  }
}

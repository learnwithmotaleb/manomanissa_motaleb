part of 'routes.dart';

class RoutePageList {
  static var list = [
    //Page Route List
GetPage(
    name: Routes.welcomeScreen,
    page: () => const WelcomeScreen(),
    binding: WelcomeBinding(),
  ),
GetPage(
    name: Routes.navigationScreen,
    page: () => const NavigationScreen(),
    binding: NavigationBinding(),
  ),
GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),

  ];
}


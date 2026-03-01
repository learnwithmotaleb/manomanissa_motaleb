import '../bind/welcome_binding.dart';
import '../views/welcome/screen/welcome_screen.dart';
import '../bind/navigation_binding.dart';
import '../views/navigation/screen/navigation_screen.dart';
import '../bind/login_binding.dart';
import '../views/login/screen/login_screen.dart';
import '../bind/splash_binding.dart';
import '../views/splash/screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part 'pages.dart';

class Routes {
  static var list = RoutePageList.list;
static const welcomeScreen = '/welcomeScreen';
static const navigationScreen = '/navigationScreen';
static const loginScreen = '/loginScreen';
static const splashScreen = '/splashScreen';

}

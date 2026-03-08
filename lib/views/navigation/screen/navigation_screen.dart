import '../../../core/utils/basic_import.dart';
import '../../blyn/screen/blyn_screen.dart';
import '../../check/screen/check_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../setting/screen/setting_screen.dart';
import '../controller/navigation_controller.dart';

part 'navigation_screen_mobile.dart';

class NavigationScreen extends GetView<NavigationController> {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NavigationScreenMobile());
  }
}

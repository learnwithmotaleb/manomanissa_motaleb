import 'package:manomanissa/views/home/widget/home_header_widget.dart';
import 'package:manomanissa/views/welcome/screen/welcome_screen.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/home_controller.dart';
import '../widget/state_card_widget.dart';

part 'home_screen_mobile.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HomeScreenMobile());
  }
}

import 'package:manomanissa/core/widgets/date_picker_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/profile_setup_controller.dart';

part 'profile_setup_screen_mobile.dart';

class ProfileSetupScreen extends GetView<ProfileSetupController> {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ProfileSetupScreenMobile());
  }
}

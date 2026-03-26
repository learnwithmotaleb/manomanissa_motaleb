import '../../../core/utils/basic_import.dart';
import '../../sleep/widget/health_details_widget.dart';
import '../controller/activity_controller.dart';

part 'activity_screen_mobile.dart';

class ActivityScreen extends GetView<ActivityController> {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ActivityScreenMobile());
  }
}

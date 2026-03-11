import 'package:manomanissa/core/widgets/loading_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/notification_controller.dart';

part 'notification_screen_mobile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NotificationScreenMobile());
  }
}

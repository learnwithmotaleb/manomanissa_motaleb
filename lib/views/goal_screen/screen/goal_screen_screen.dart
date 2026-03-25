import '../../../core/utils/basic_import.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controller/goal_screen_controller.dart';

part 'goal_screen_screen_mobile.dart';

class GoalScreenScreen extends GetView<GoalScreenController> {
  const GoalScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: GoalScreenScreenMobile());
  }
}

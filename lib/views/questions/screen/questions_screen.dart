import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';
import '../controller/questions_controller.dart';
part 'questions_screen_mobile.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: QuestionsScreenMobile());
  }
}

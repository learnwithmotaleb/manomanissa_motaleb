import '../../../core/utils/basic_import.dart';
import '../../welcome/screen/welcome_screen.dart';
import '../controller/ai_chat_controller.dart';

part 'ai_chat_screen_mobile.dart';

class AiChatScreen extends GetView<AiChatController> {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: AiChatScreenMobile());
  }
}

import '../../../core/utils/basic_import.dart';
class AiChatController extends GetxController {
  final inputController = TextEditingController();
  final scrollController = ScrollController();
  final messages = <Map<String, String>>[].obs;

  void onSend() {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    messages.add({'text': text, 'isUser': 'true'});
    inputController.clear();

    Future.delayed(const Duration(milliseconds: 800), () {
      messages.add({'text': 'I am Blyn, your AI assistant!', 'isUser': 'false'});
      _scrollToBottom();
    });

    _scrollToBottom();
  }

  void onNewChat() {
    messages.clear();
  }

  void onMenu() {
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
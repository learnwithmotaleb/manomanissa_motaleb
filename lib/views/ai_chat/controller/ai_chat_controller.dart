import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/ai_chat_model.dart';
class AiChatController extends GetxController {
  final inputController = TextEditingController();
  final searchController = TextEditingController();
  final scrollController = ScrollController();

  final messages = <Map<String, String>>[].obs;
  final chatHistory = <ConversationModel>[].obs;
  final filteredHistory = <ConversationModel>[].obs;

  final isLoading = false.obs;
  final isSending = false.obs;

  @override
  void onInit() {
    super.onInit();
    getConversations();
    searchController.addListener(_onSearch);
  }

  Future<void> getConversations() async {
    await ApiRequest().get(
      fromJson: (json) {
        final list = (json['data'] ?? []) as List;
        return list.map((e) => ConversationModel.fromJson(e)).toList();
      },
      endPoint: '/assistant/conversations',
      isLoading: isLoading,
      queryParams: {'user_id': AppStorage.userId},
      useAiBaseUrl: true,
      onSuccess: (result) {
        chatHistory.assignAll(result);
        filteredHistory.assignAll(result);
      },
    );
  }

  // ─── POST: Send Message ─────────────────────────────────
  Future<void> onSend() async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    // User message তাৎক্ষণিক দেখাও
    messages.add({'text': text, 'isUser': 'true'});
    inputController.clear();
    _scrollToBottom();

    await ApiRequest().post(
      fromJson: AiChatModel.fromJson,
      endPoint: '/assistant/ask',
      isLoading: isSending,
      useAiBaseUrl: true,
      body: {
        "user_id": AppStorage.userId,
        "question": text,
      },
      onSuccess: (result) {
        messages.add({'text': result.answer, 'isUser': 'false'});
        _scrollToBottom();
        getConversations(); // history refresh
      },
    );
  }

  void onNewChat() {
    messages.clear();
  }

  void loadHistory(ConversationModel conv) {
    messages.clear();
    messages.add({'text': conv.question, 'isUser': 'true'});
    messages.add({'text': conv.answer, 'isUser': 'false'});
    Get.back();
    _scrollToBottom();
  }

  void _onSearch() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredHistory.assignAll(chatHistory);
    } else {
      filteredHistory.assignAll(
        chatHistory.where((c) => c.question.toLowerCase().contains(query)),
      );
    }
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
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
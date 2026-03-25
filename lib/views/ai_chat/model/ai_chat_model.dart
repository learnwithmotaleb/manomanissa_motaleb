class AiChatModel {
  final String answer;
  final bool isFaq;
  final String provider;

  AiChatModel({required this.answer, required this.isFaq, required this.provider});

  factory AiChatModel.fromJson(Map<String, dynamic> json) => AiChatModel(
    answer: json["answer"] ?? '',
    isFaq: json["is_faq"] ?? false,
    provider: json["provider"] ?? '',
  );
}

class ConversationModel {
  final String id;
  final String userId;
  final String question;
  final String answer;
  final bool isFaq;
  final String createdAt;

  ConversationModel({
    required this.id,
    required this.userId,
    required this.question,
    required this.answer,
    required this.isFaq,
    required this.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
    id: json["id"] ?? '',
    userId: json["user_id"] ?? '',
    question: json["question"] ?? '',
    answer: json["answer"] ?? '',
    isFaq: json["is_faq"] ?? false,
    createdAt: json["created_at"] ?? '',
  );
}

// GET response List wrapper
class ConversationListModel {
  final List<ConversationModel> data;

  ConversationListModel({required this.data});

  factory ConversationListModel.fromJson(Map<String, dynamic> json) {
    final list = json['data'];
    return ConversationListModel(
      data: list is List
          ? list.map((e) => ConversationModel.fromJson(e)).toList()
          : [],
    );
  }
}
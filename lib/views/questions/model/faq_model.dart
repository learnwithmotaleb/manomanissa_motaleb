class FaqModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Faqs> data;

  FaqModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Faqs>.from(json["data"].map((x) => Faqs.fromJson(x))),
  );
}

class Faqs{
  final String id;
  final String question;
  final String answer;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Faqs({
    required this.id,
    required this.question,
    required this.answer,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Faqs.fromJson(Map<String, dynamic> json) => Faqs(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}

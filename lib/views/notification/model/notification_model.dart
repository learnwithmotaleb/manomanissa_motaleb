
class NotificationModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Notifications> data;

  NotificationModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Notifications>.from(json["data"].map((x) => Notifications.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notifications {
  final String id;
  final String userId;
  final String title;
  final String message;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Notifications({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["_id"],
    userId: json["userId"],
    title: json["title"],
    message: json["message"],
    isRead: json["isRead"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "title": title,
    "message": message,
    "isRead": isRead,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
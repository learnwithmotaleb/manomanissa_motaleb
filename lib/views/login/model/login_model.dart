
class LoginModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  LoginModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final User user;
  final String accessToken;
  final String refreshToken;

  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );
}

class User {
  final String email;
  final String userId;

  User({
    required this.email,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    userId: json["userId"],
  );
}

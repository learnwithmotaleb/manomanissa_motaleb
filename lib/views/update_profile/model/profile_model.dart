class ProfileModel {
  final bool success;
  final int statusCode;
  final String message;
  final ProfileData? data;

  ProfileModel({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] != null ? ProfileData.fromJson(json["data"]) : null,
  );
}

class ProfileData {
  final String? id;
  final String? user;
  final String? name;
  final String? gender;
  final String? dateOfBirth;
  final int? heightCm;
  final double? weightKg;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileData({
    this.id,
    this.user,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.heightCm,
    this.weightKg,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["_id"],
    user: json["user"],
    name: json["name"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    heightCm: json["heightCm"],
    weightKg: (json["weightKg"] as num?)?.toDouble(),
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
  );
}
// To parse this JSON data, do
//
//     final resetOtpVerifyModel = resetOtpVerifyModelFromJson(jsonString);

import 'dart:convert';

ResetOtpVerifyModel resetOtpVerifyModelFromJson(String str) => ResetOtpVerifyModel.fromJson(json.decode(str));

String resetOtpVerifyModelToJson(ResetOtpVerifyModel data) => json.encode(data.toJson());

class ResetOtpVerifyModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  ResetOtpVerifyModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ResetOtpVerifyModel.fromJson(Map<String, dynamic> json) => ResetOtpVerifyModel(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final String resetToken;

  Data({
    required this.resetToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resetToken: json["resetToken"],
  );

  Map<String, dynamic> toJson() => {
    "resetToken": resetToken,
  };
}

class BasicSuccessModel {
  final bool success;
  final String message;
  final dynamic data;

  BasicSuccessModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory BasicSuccessModel.fromJson(Map<String, dynamic> json) {
    return BasicSuccessModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}

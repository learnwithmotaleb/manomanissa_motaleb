class ApiEndPoints {
  static const String baseUrl = 'http://16.58.107.165/api';


  // AUTH ENDPOINTS
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/auth/send-reset-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = '/auth/verify-reg-otp';
  static const String verifyResetOtp = '/auth/verify-reset-otp';
  static const String resendOtp = '/auth/resend-otp';
  static const String changePassword = '/auth/resend-otp';

}

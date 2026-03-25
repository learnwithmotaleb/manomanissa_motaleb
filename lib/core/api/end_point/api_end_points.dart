class ApiEndPoints {
  static const String baseUrl = 'http://10.10.20.22:3002/api';
  static const String aiBaseUrl = 'http://10.10.20.111:8006';


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

  static const String userChangePassword = '/users/change-password';
  static const String privacyPolicy = '/legal-content/privacy-policy';
  static const String termsConditions = '/legal-content/terms-and-conditions';

}

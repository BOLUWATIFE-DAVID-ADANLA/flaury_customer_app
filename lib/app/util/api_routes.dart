class ApiRoutes {
  static const String baseUrl = "https://flaury.onrender.com";

  // AUTH ENDPOINTS
  static const String forgotPassword = "/api/users/forgot-password";
  static const String verifyUserAuth = "/api/users/auth-check";
  static const String login = "/api/users/login";
  static const String logout = "/api/users/logout";
  static const String refreshAccessToken = "/api/users/refresh";
  static const String signUp = "/api/users/register";
  static const String resendVerifcationCode = "/api/users/resend-verification";
  static const String verifyEmail = "/api/users/verify-email";
  static const String resetPassword = "/api/users/reset-password";
}

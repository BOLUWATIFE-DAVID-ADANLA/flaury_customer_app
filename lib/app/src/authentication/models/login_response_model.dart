class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String role;
  final String userId;
  final String responseDescription;
  final String responseStatus;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.userId,
    required this.responseDescription,
    required this.responseStatus,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final responseData = json['response data'] as Map<String, dynamic>;
    return LoginResponse(
      accessToken: responseData['access_token'] ?? '',
      refreshToken: responseData['refresh_token'] ?? '',
      role: responseData['role'] ?? '',
      userId: responseData['user_id'] ?? '',
      responseDescription: json['response description'] ?? '',
      responseStatus: json['response status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response data': {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'role': role,
        'user_id': userId,
      },
      'response description': responseDescription,
      'response status': responseStatus,
    };
  }
}

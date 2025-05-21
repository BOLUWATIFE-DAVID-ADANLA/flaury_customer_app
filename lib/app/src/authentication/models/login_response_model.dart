class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String responseDescription;
  final String responseStatus;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.responseDescription,
    required this.responseStatus,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final responseData = json['response data'];
    return LoginResponse(
      accessToken: responseData['access_token'],
      refreshToken: responseData['refresh_token'],
      responseDescription: json['response description'],
      responseStatus: json['response status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response data': {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      },
      'response description': responseDescription,
      'response status': responseStatus,
    };
  }
}

class RegisterResponse {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String message;
  final String status;

  RegisterResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.message,
    required this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['response data']['access_token'],
      refreshToken: json['response data']['refresh_token'],
      userId: json['response data']['user_id'],
      message: json['response description'],
      status: json['response status'],
    );
  }
}

class ApiResponseModel {
  final dynamic data;
  final String message;
  final String status;

  ApiResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      data: json['response data'],
      message: json['response description'],
      status: json['response status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response data': data,
      'response description': message,
      'response status': status,
    };
  }
}

class RegisterResponse {
  final String? message; // Nullable for error case
  final int description;
  final String status;
  final String? errorDetails; // Only present in error case

  RegisterResponse({
    this.message,
    required this.description,
    required this.status,
    this.errorDetails,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['response data'],
      description: json['response description'],
      status: json['response status'],
      errorDetails: json['error details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'response data': message,
      'response description': description,
      'response status': status,
      if (errorDetails != null) 'error details': errorDetails,
    };
  }
}

class ApiResponseModel {
  final dynamic data;
  final int description;
  final String status;

  ApiResponseModel({
    required this.data,
    required this.description,
    required this.status,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      data: json['response data'],
      description: json['response description'],
      status: json['response status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response data': data,
      'response description': description,
      'response status': status,
    };
  }
}

class LogoutResponseModel {
  final String responseDescription;
  final String responseStatus;
  final dynamic responseData;

  LogoutResponseModel({
    required this.responseDescription,
    required this.responseStatus,
    this.responseData,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      responseDescription: json['response description'] ?? '',
      responseStatus: json['response status'] ?? '',
      responseData: json['rsponse data'], // dynamic to accept any type or null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response description': responseDescription,
      'response status': responseStatus,
      'rsponse data': responseData,
    };
  }
}

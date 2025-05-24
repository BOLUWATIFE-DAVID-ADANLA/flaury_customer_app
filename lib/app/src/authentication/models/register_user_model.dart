class RegisterResponse {
  final String message;
  final int description;
  final String status;

  RegisterResponse({
    required this.message,
    required this.description,
    required this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['response data'],
      description: json['response description'],
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

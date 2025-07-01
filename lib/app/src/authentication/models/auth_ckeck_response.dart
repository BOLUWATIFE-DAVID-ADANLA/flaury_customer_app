class AuthCheckResponse {
  final AuthUserData responseData;
  final String responseDescription;
  final bool responseStatus;

  AuthCheckResponse({
    required this.responseData,
    required this.responseDescription,
    required this.responseStatus,
  });

  factory AuthCheckResponse.fromJson(Map<String, dynamic> json) {
    return AuthCheckResponse(
      responseData: AuthUserData.fromJson(json['response data']),
      responseDescription: json['response description'] ?? '',
      responseStatus: json['response status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response data': responseData.toJson(),
      'response description': responseDescription,
      'response status': responseStatus,
    };
  }
}

class AuthUserData {
  final String email;
  final String id;
  final bool isVerified;
  final String name;
  final String phoneNumber;
  final String role;
  final String? userName;

  AuthUserData({
    required this.email,
    required this.id,
    required this.isVerified,
    required this.name,
    required this.phoneNumber,
    required this.role,
    this.userName,
  });

  factory AuthUserData.fromJson(Map<String, dynamic> json) {
    return AuthUserData(
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      isVerified: json['is_verified'] ?? false,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      role: json['role'] ?? '',
      userName: json['user_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'is_verified': isVerified,
      'name': name,
      'phone_number': phoneNumber,
      'role': role,
      'user_name': userName,
    };
  }
}

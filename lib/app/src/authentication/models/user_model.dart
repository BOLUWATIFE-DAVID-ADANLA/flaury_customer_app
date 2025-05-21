class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final bool isVerified;
  final String? userName;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.isVerified,
    this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role: json['role'],
      isVerified: json['is_verified'],
      userName: json['user_name'],
    );
  }
}

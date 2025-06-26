class UserModel {
  final String id;
  final String email;
  final String name;
  final String role;
  final bool isVerified;
  final String? userName;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.isVerified,
    this.userName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
      isVerified: json['is_verified'],
      userName: json['user_name'],
    );
  }
}

class CreateUserEntity {
  final String name;
  final String email;
  final String role;
  final String jobTitle;
  final bool isActive;
  final DateTime createdAt;
  final String? phoneNumber;

  CreateUserEntity( {
    required this.name,
    required this.email,
    required this.role,
    required this.jobTitle,
    required this.isActive,
    this.phoneNumber,
    required this.createdAt
  });


  Map<String , dynamic >toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'jobTitle': jobTitle,
      'isActive': isActive,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

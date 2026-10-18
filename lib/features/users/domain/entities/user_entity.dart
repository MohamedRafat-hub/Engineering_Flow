
import 'package:engineering_flow/features/users/domain/enums/user_role.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String jobTitle;
  final bool isActive;
  final DateTime createdAt;
  final String? phoneNumber;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.jobTitle,
    required this.isActive,
    required this.createdAt,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role.name,
      'jobTitle': jobTitle,
      'isActive': isActive,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
    };
  }

}

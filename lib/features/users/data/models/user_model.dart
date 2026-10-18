
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';
import '../../domain/enums/user_role.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.jobTitle,
    required super.isActive,
    required super.createdAt,
    super.phoneNumber,
  });

  factory UserModel.fromMap(
      Map<String, dynamic> map, {
        required String id,
      }) {
    return UserModel(
      id: id,
      name: map['name'] as String,
      email: map['email'] as String,
      role: UserRole.values.byName(map['role'] as String),
      jobTitle: map['jobTitle'] as String,
      isActive: map['isActive'] as bool? ?? false,
      createdAt: DateTime.parse(map['createdAt'] as String),
      phoneNumber: map['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
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

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      role: role,
      jobTitle: jobTitle,
      isActive: isActive,
      createdAt: createdAt,
      phoneNumber: phoneNumber,
    );
  }
}

import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';

import '../../domain/enums/user_role.dart';

class CreateUserModel extends CreateUserEntity {
  CreateUserModel({
    required super.name,
    required super.email,
    required super.role,
    required super.jobTitle,
    required super.isActive,
    required super.createdAt,
    super.phoneNumber,
  });

  factory CreateUserModel.fromMap(Map<String, dynamic> map) {
    return CreateUserModel(
      name: map['name'],
      email: map['email'],
      role: UserRole.values.byName(map['role']),
      jobTitle: map['jobTitle'],
      isActive: map['isActive'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      phoneNumber: map['phoneNumber'] ?? null,
    );
  }

  Map<String, dynamic> toJson(CreateUserModel userModel) {
    return {
      'name': userModel.name,
      'email': userModel.email,
      'role': userModel.role,
      'jobTitle': userModel.jobTitle,
      'isActive': userModel.isActive,
      'createdAt': userModel.createdAt,
    };
  }

  CreateUserEntity toEntity() {
    return CreateUserEntity(
      name: name,
      email: email,
      role: role,
      jobTitle: jobTitle,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}

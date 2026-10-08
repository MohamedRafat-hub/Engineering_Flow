import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';

class CreateUserModel extends CreateUserEntity {
  CreateUserModel({
    required super.name,
    required super.email,
    required super.role,
    required super.jobTitle,
    required super.isActive,
    required super.createdAt,
  });

  factory CreateUserModel.fromMap(Map<String, dynamic> map) {
    return CreateUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      isActive: map['isActive'] ?? false,
      createdAt: map['createdAt'],
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
}

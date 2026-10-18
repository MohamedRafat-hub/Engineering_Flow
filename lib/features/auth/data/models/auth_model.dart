import 'package:engineering_flow/features/auth/domain/entities/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    required super.uId,
    required super.name,
    required super.role,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      uId: json['uId'],
      name: json['name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'uId': uId, 'name': name, 'role': role};
  }

  factory AuthModel.fromFirebaseUser(User user) {
    return AuthModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      role: '',
    );
  }
}

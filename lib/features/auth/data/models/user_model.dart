import 'package:engineering_flow/features/auth/domain/entities/uer_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity{
  UserModel({required super.email, required super.uId, required super.name, required super.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      uId: json['uId'],
      name: json['name'],
      role: json['role'],
    );
  }
  Map<String , dynamic >toJson(){
    return {
      'email':email,
      'uId':uId,
      'name':name,
      'role':role,
    };
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      role: '',
    );
  }
}
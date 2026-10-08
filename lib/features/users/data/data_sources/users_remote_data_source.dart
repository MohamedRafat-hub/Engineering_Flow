import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/database_service.dart';

abstract class UsersRemoteDataSource {
  Future<String>createUser({required String email , required String password});
  Future<void> addUser({required Map<String, dynamic> userData , required String uid});
  Future<void> deleteUser({required String uid});
}


class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final DatabaseService _databaseService;
  final FirebaseAuthService _firebaseAuthService;

  UsersRemoteDataSourceImpl(this._databaseService, FirebaseAuthService firebaseAuthService) : _firebaseAuthService = firebaseAuthService;

  @override
  Future<void> addUser({required Map<String, dynamic> userData , required String uid})async {
    return await _databaseService.addData(path: 'users', data: userData , uid: uid);
  }

  @override
  Future<String> createUser({required String email, required String password})async {
   final user =await _firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
   return user;
  }

  @override
  Future<void> deleteUser({required String uid}) {
    return _databaseService.addData(path: 'users', data: {}, uid: uid);
  }
}
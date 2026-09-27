import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:engineering_flow/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email , required String password});
  Future<void> passwordReset({required String email});
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuthService _firebaseAuthService;

  AuthRemoteDataSourceImpl(this._firebaseAuthService);
  @override
  Future<UserModel> login({required String email, required String password}) {
    return _firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> passwordReset({required String email}){
    return _firebaseAuthService.passwordReset(email);
  }
}
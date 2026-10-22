import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:engineering_flow/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email , required String password});
  Future<void> passwordReset({required String email});
  Future<void> logout();
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuthService _firebaseAuthService;

  AuthRemoteDataSourceImpl(this._firebaseAuthService);
  @override
  Future<AuthModel> login({required String email, required String password}) {
    return _firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> passwordReset({required String email}){
    return _firebaseAuthService.passwordReset(email);
  }

  @override
  Future<void> logout() {
    return _firebaseAuthService.signOut();
  }
}
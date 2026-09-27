import 'dart:developer';

import 'package:engineering_flow/core/errors/error_handling.dart';
import 'package:engineering_flow/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        throw const AuthException('User not found');
      }

      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code}');
      throw ErrorHandling.handleAuthException(e);
    } catch (e) {
      log('Unexpected error: $e');

      throw const ServerException(
        'Something went wrong. Please try again.',
      );
    }
  }


  Future<void> passwordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw ErrorHandling.handleAuthException(e);
    }
  }

}
import 'dart:developer';

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

      switch (e.code) {
        case 'invalid-email':
          throw const AuthException(
            'Please enter a valid email address.',
          );

        case 'user-disabled':
          throw const AuthException(
            'This account has been disabled. Please contact support.',
          );

        case 'user-not-found':
          throw const AuthException(
            'No account found with this email.',
          );

        case 'wrong-password':
          throw const AuthException(
            'Incorrect password. Please try again.',
          );

        case 'invalid-credential':
          throw const AuthException(
            'Incorrect email or password. Please try again.',
          );

        case 'email-already-in-use':
          throw const AuthException(
            'An account already exists with this email.',
          );

        case 'weak-password':
          throw const AuthException(
            'Your password is too weak. Please choose a stronger password.',
          );

        case 'operation-not-allowed':
          throw const AuthException(
            'This sign-in method is currently unavailable.',
          );

        case 'too-many-requests':
          throw const AuthException(
            'Too many attempts. Please try again later.',
          );

        case 'network-request-failed':
          throw const AuthException(
            'Network error. Please check your internet connection.',
          );

        case 'requires-recent-login':
          throw const AuthException(
            'Please sign in again to continue.',
          );

        default:
          throw  AuthException(
            'Something went wrong. Please try again.${e.message}',
          );
      }
    } catch (e) {
      log('Unexpected error: $e');

      throw const ServerException(
        'Something went wrong. Please try again.',
      );
    }
  }
}
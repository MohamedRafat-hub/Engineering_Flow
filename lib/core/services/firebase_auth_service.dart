import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signInWithEmailAndPassword({
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

      return user;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code}');

      switch (e.code) {
        case 'user-not-found':
          throw const AuthException("Email doesn't exist");

        case 'wrong-password':
          throw const AuthException('Incorrect password');

        case 'network-request-failed':
          throw const NetworkException(
            'No Internet connection. Please reconnect and try again.',
          );

        default:
          throw const AuthException(
            'There was a problem logging in. Please try again.',
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
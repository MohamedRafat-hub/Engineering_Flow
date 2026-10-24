
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:engineering_flow/core/errors/error_handling.dart';
import 'package:engineering_flow/core/services/internet_connection_service.dart';
import 'package:engineering_flow/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../firebase_options.dart';
import '../errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final InternetConnectionService _internetConnectionService;

  FirebaseAuthService(
      this._internetConnectionService, {
        FirebaseAuth? firebaseAuth,
      }) : _auth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> _checkInternetConnection() async {
    final hasInternet =
    await _internetConnectionService.hasInternetAccess;

    if (!hasInternet) {
      throw const NoInternetException();
    }
  }

  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _checkInternetConnection();

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        throw const AuthException('User not found');
      }

      return AuthModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code}');
      throw ErrorHandling.handleAuthException(e);
    } catch (e, stackTrace) {
      log(
        'Unexpected error during sign in',
        error: e,
        stackTrace: stackTrace,
      );

      throw const ServerException(
        'Something went wrong. Please try again.',
      );
    }
  }

  Future<void> passwordReset(String email) async {
    await _checkInternetConnection();

    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ErrorHandling.handleAuthException(e);
    }
  }

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _checkInternetConnection();

    final cleanEmail = email.trim().toLowerCase();
    final apiKey = DefaultFirebaseOptions.currentPlatform.apiKey;

    final uri = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey',
    );

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': cleanEmail,
          'password': password,
          'returnSecureToken': false,
        }),
      );

      final body =
      jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        final message =
            body['error']?['message'] as String? ?? 'UNKNOWN';

        log('Create user failed: $message');

        switch (message) {
          case 'EMAIL_EXISTS':
            throw const AuthException('Email already exists');
          case 'WEAK_PASSWORD : Password should be at least 6 characters':
            throw const AuthException('Weak password');
          case 'INVALID_EMAIL':
            throw const AuthException('Invalid email address');
          default:
            throw const AuthException('Create user failed');
        }
      }

      return body['localId'] as String;
    } on AuthException {
      rethrow;
    } on SocketException {
      throw const NoInternetException();
    } catch (e, stackTrace) {
      log(
        'Unexpected error while creating user',
        error: e,
        stackTrace: stackTrace,
      );

      throw const AuthException(
        'There was an error. Please try again.',
      );
    }
  }

  Future<void> deleteCreatedUser({
    required String idToken,
  }) async {
    await _checkInternetConnection();

    final apiKey = DefaultFirebaseOptions.currentPlatform.apiKey;

    final uri = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:delete?key=$apiKey',
    );

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'idToken': idToken,
        }),
      );

      if (response.statusCode != 200) {
        final body =
        jsonDecode(response.body) as Map<String, dynamic>;

        final message =
            body['error']?['message'] as String? ?? 'UNKNOWN';

        log('Delete user failed: $message');

        throw const AuthException(
          'Failed to delete created user.',
        );
      }
    } on AuthException {
      rethrow;
    } on SocketException {
      throw const NoInternetException();
    } catch (e, stackTrace) {
      log(
        'Unexpected error while deleting user',
        error: e,
        stackTrace: stackTrace,
      );

      throw const AuthException(
        'There was an error while deleting the user.',
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}

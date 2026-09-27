import 'package:firebase_auth/firebase_auth.dart';

import 'exceptions.dart';

class ErrorHandling {
  static AuthException handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
    // ─────────────── Sign In ───────────────

      case 'invalid-credential':
        return AuthException(
          'The email or password is incorrect.',
        );

      case 'user-disabled':
        return AuthException(
          'This account has been disabled.',
        );

      case 'user-not-found':
        return AuthException(
          'No account was found with this email.',
        );

      case 'wrong-password':
        return AuthException(
          'The email or password is incorrect.',
        );

      case 'invalid-email':
        return AuthException(
          'Please enter a valid email address.',
        );

    // ─────────────── Sign Up ───────────────

      case 'email-already-in-use':
        return AuthException(
          'An account already exists with this email.',
        );

      case 'weak-password':
        return AuthException(
          'The password is too weak.',
        );

    // ─────────────── General Auth ───────────────

      case 'operation-not-allowed':
        return AuthException(
          'This authentication method is currently unavailable.',
        );

      case 'too-many-requests':
        return AuthException(
          'Too many attempts. Please try again later.',
        );

      case 'network-request-failed':
        return AuthException(
          'Please check your internet connection and try again.',
        );

      case 'requires-recent-login':
        return AuthException(
          'For security reasons, please sign in again and try again.',
        );

      case 'user-token-expired':
        return AuthException(
          'Your session has expired. Please sign in again.',
        );

      case 'user-token-revoked':
        return AuthException(
          'Your session is no longer valid. Please sign in again.',
        );

      case 'invalid-user-token':
        return AuthException(
          'Your session is no longer valid. Please sign in again.',
        );

    // ─────────────── Email Verification ───────────────

      case 'email-already-verified':
        return AuthException(
          'This email address is already verified.',
        );

      case 'invalid-verification-code':
        return AuthException(
          'The verification code is invalid or has expired.',
        );

    // ─────────────── Credential / Provider ───────────────

      case 'credential-already-in-use':
        return AuthException(
          'This credential is already associated with another account.',
        );

      case 'provider-already-linked':
        return AuthException(
          'This sign-in provider is already linked to your account.',
        );

      case 'account-exists-with-different-credential':
        return AuthException(
          'An account already exists with this email using a different sign-in method.',
        );

      case 'invalid-verification-id':
        return AuthException(
          'The verification session is invalid. Please try again.',
        );

    // ─────────────── Multi-Factor ───────────────

      case 'second-factor-already-in-use':
        return AuthException(
          'This second factor is already associated with an account.',
        );

      case 'maximum-second-factor-count-exceeded':
        return AuthException(
          'You have reached the maximum number of second factors.',
        );

    // ─────────────── Fallback ───────────────

      default:
        return AuthException(
          'Something went wrong. Please try again later.',
        );
    }
  }
}
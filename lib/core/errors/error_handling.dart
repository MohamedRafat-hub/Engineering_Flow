import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'exceptions.dart';

class ErrorHandling {
  // ─────────────── Firebase Auth ───────────────

  static AuthException handleAuthException(FirebaseAuthException e) {
    log(e.toString());
    switch (e.code) {
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

      case 'email-already-in-use':
        return AuthException(
          'An account already exists with this email.',
        );

      case 'weak-password':
        return AuthException(
          'The password is too weak.',
        );

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
      case 'user-token-revoked':
      case 'invalid-user-token':
        return AuthException(
          'Your session is no longer valid. Please sign in again.',
        );

      case 'email-already-verified':
        return AuthException(
          'This email address is already verified.',
        );

      case 'invalid-verification-code':
        return AuthException(
          'The verification code is invalid or has expired.',
        );

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

      case 'second-factor-already-in-use':
        return AuthException(
          'This second factor is already associated with an account.',
        );

      case 'maximum-second-factor-count-exceeded':
        return AuthException(
          'You have reached the maximum number of second factors.',
        );

      default:
        return AuthException(
          'Something went wrong. Please try again later.',
        );
    }
  }

  // ─────────────── Firestore ───────────────

  static FirestoreException handleFirestoreException(
      FirebaseException e,
      ) {
    switch (e.code) {
      case 'permission-denied':
        return FirestoreException(
          'You do not have permission to perform this operation.',
        );

      case 'not-found':
        return FirestoreException(
          'The requested data was not found.',
        );

      case 'already-exists':
        return FirestoreException(
          'This data already exists.',
        );

      case 'aborted':
        return FirestoreException(
          'The operation was aborted. Please try again.',
        );

      case 'cancelled':
        return FirestoreException(
          'The operation was cancelled.',
        );

      case 'deadline-exceeded':
        return FirestoreException(
          'The operation took too long. Please try again.',
        );

      case 'unavailable':
        return FirestoreException(
          'The service is temporarily unavailable. Please try again later.',
        );

      case 'resource-exhausted':
        return FirestoreException(
          'The service limit has been reached. Please try again later.',
        );

      case 'failed-precondition':
        return FirestoreException(
          'The operation cannot be completed in the current state.',
        );

      case 'invalid-argument':
        return FirestoreException(
          'Invalid data was provided.',
        );

      case 'unauthenticated':
        return FirestoreException(
          'Your session has expired. Please sign in again.',
        );

      case 'data-loss':
        return FirestoreException(
          'A data error occurred. Please try again.',
        );

      case 'internal':
        return FirestoreException(
          'An internal error occurred. Please try again later.',
        );

      case 'out-of-range':
        return FirestoreException(
          'The provided data is out of range.',
        );

      case 'unimplemented':
        return FirestoreException(
          'This operation is not supported.',
        );

      case 'unknown':
        return FirestoreException(
          'An unknown error occurred. Please try again.',
        );

      default:
        return FirestoreException(
          'Something went wrong while accessing the database.',
        );
    }
  }
}
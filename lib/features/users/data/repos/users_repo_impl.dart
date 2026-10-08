import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/error_handling.dart';
import 'package:engineering_flow/core/errors/exceptions.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersRepoImpl implements UsersRepo {
  final UsersRemoteDataSource _remoteDataSource;

  UsersRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> addUser({
    required Map<String, dynamic> userData,
    required String uid,
  }) async {
    try {
      await _remoteDataSource.addUser(userData: userData, uid: uid);
      return right(null);
    } on FirebaseException catch (e) {
      final firebaseException = ErrorHandling.handleFirestoreException(e);
      return left(ServerFailure(firebaseException.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.createUser(
        email: email,
        password: password,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      String message = ErrorHandling.handleAuthException(e).message;
      return left(ServerFailure(message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser({required String uid}) async {
    try {
      await _remoteDataSource.deleteUser(uid: uid);
      return right(null);
    } on FirebaseAuthException catch (e) {
      final authException = ErrorHandling.handleAuthException(e);
      return left(ServerFailure(authException.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createUserAccount({
    required String email,
    required String password,
    required Map<String, dynamic> userData,
  }) async {
    {
      String? uid;
      try {
        uid = await _remoteDataSource.createUser(
          email: email,
          password: password,
        );

        await _remoteDataSource.addUser(userData: userData, uid: uid);

        return right(null);
      }  on AuthException catch(e)
    {
      return left(ServerFailure(e.message));
    }
      catch (e) {
        if (uid != null) {
          try {
            await _remoteDataSource.deleteUser(uid: uid!);
          } catch (deleteError) {
            log('Rollback failed: $deleteError');
          }
        }

        String message;

        message = e is FirebaseAuthException
            ? ErrorHandling.handleAuthException(e).message
            : e.toString();

        message = e is FirebaseException ? ErrorHandling.handleFirestoreException(e).message : message;

        return left(ServerFailure(message));
      }
    }
  }
}

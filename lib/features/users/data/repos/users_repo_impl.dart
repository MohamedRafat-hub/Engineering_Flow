import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/error_handling.dart';
import 'package:engineering_flow/core/errors/exceptions.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:engineering_flow/features/users/data/models/user_model.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';
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
    } on NoInternetException{
      return left(InternetConnectionFailure("No internet connection"));
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
    } on NoInternetException {
      return left(InternetConnectionFailure("No internet connection"));
    }
    on FirebaseAuthException catch (e) {
      String message = ErrorHandling.handleAuthException(e).message;
      return left(ServerFailure(message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser({required String uid}) async {
    try {
      await _remoteDataSource.deleteUser(id: uid);
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
      }on NoInternetException {
        return left(InternetConnectionFailure("No internet connection"));
      }
      on AuthException catch (e) {
        return left(ServerFailure(e.message));
      } catch (e) {
        if (uid != null) {
          try {
            await _remoteDataSource.deleteUser(id: uid);
          } catch (deleteError) {
            log('Rollback failed: $deleteError');
          }
        }

        String message;

        message = e is FirebaseAuthException
            ? ErrorHandling.handleAuthException(e).message
            : e.toString();

        message = e is FirebaseException
            ? ErrorHandling.handleFirestoreException(e).message
            : message;

        return left(ServerFailure(message));
      }
    }
  }

  @override
  Stream<Either<Failure, List<UserEntity>>> getAllUsers() async* {
    try {
      await for (final data in _remoteDataSource.getAllUsers()) {
        final users = data.map((map) {
          return UserModel.fromMap(map, id: map['id'] as String).toEntity();
        }).toList();

        yield right(users);
      }
    } on FirebaseException catch (e) {
      final exception = ErrorHandling.handleFirestoreException(e);
      yield left(ServerFailure(exception.message));
    } catch (e, stackTrace) {
      log(
        'Unexpected error while watching users',
        error: e,
        stackTrace: stackTrace,
      );

      yield left(ServerFailure('There was an error while fetching users.'));
    }
  }

  @override
  Future<Either<Failure, void>> changeUserActiveStatus(
    String userId,
    bool isActive,
  ) async {
    try {
      await _remoteDataSource.changeUserActiveStatus(userId, {
        'isActive': isActive,
      });
      return right(null);
    } on NoInternetException {
      return left(InternetConnectionFailure("No internet connection"));
    } on FirebaseException catch (e) {
      final String errorMessage = ErrorHandling.handleFirestoreException(
        e,
      ).message;
      return left(ServerFailure(errorMessage));
    } catch (e) {
      return left(ServerFailure("Something went wrong. ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final userData = await _remoteDataSource.getCurrentUser();

      if (userData == null) {
        return left(ServerFailure('User profile not found.'));
      }

      final userModel = UserModel.fromMap(
        userData,
        id: userData['id'] as String,
      );

      return right(userModel.toEntity());
    } on FirebaseException catch (e) {
      final exception = ErrorHandling.handleFirestoreException(e);
      return left(ServerFailure(exception.message));
    } catch (e, stackTrace) {
      log(
        'Unexpected error while fetching current user',
        error: e,
        stackTrace: stackTrace,
      );

      return left(
        ServerFailure('There was an error while fetching your profile.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _remoteDataSource.updateProfile(userId: userId, data: data);

      return right(null);
    } on NoInternetException catch (e) {
      return left(InternetConnectionFailure("No internet connection"));
    } on FirebaseException catch (e) {
      final exception = ErrorHandling.handleFirestoreException(e);
      return left(ServerFailure(exception.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

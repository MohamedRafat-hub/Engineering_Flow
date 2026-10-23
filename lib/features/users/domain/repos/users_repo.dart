import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/auth/domain/entities/auth_entity.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

abstract class UsersRepo {
  Future<Either<Failure, String>> createUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> addUser({
    required Map<String, dynamic> userData,
    required String uid,
  });

  Future<Either<Failure, void>> deleteUser({required String uid});

  Future<Either<Failure, void>> createUserAccount({
    required String email ,
    required String password ,
    required Map<String, dynamic> userData,
  });

  Stream<Either<Failure, List<UserEntity>>>getAllUsers();


  Future<Either<Failure, void>> changeUserActiveStatus(
    String userId,
    bool isActive,
  );

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, void>> updateProfile({
    required String userId,
    required Map<String, dynamic> data,
  });
}

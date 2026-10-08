import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';

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
}

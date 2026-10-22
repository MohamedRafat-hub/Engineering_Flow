import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure , AuthEntity>>login({required String email , required String password});
  Future<Either<Failure , void>>passwordReset({required String email});
  Future<Either<Failure, void>> logout();
}
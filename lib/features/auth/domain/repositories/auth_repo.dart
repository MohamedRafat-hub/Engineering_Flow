import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/auth/domain/entities/uer_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure , UserEntity>>login({required String email , required String password});
}
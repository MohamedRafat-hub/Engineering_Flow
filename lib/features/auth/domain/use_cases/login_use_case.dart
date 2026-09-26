import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/auth/domain/entities/uer_entity.dart';
import 'package:engineering_flow/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/use_cases/use_case.dart';

class LoginUseCase extends UseCase<UserEntity , LoginParams>{

  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<Either<Failure, UserEntity>> call(loginParams) {
    return _authRepo.login(email: loginParams.email ,password: loginParams.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });
}
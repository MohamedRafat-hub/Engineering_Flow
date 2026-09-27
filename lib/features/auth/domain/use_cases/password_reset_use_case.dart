import 'package:dartz/dartz.dart';

import 'package:engineering_flow/core/errors/failures.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repositories/auth_repo.dart';

class PasswordResetUseCase extends UseCase<void , String>{
  final AuthRepo _authRepo;

  PasswordResetUseCase(this._authRepo);
  @override
  Future<Either<Failure, void>> call(String email) {
    return _authRepo.passwordReset(email: email);
  }
}
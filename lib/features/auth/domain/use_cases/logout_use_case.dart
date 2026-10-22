import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/core/use_cases/use_case.dart';
import 'package:engineering_flow/features/auth/domain/repositories/auth_repo.dart';

class LogoutUseCase extends UseCase<void, void> {
  final AuthRepo _authRepo;

  LogoutUseCase(this._authRepo);

  @override
  Future<Either<Failure, void>> call(void params) {
    return _authRepo.logout();
  }
}

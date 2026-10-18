import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/core/use_cases/use_case.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';

class ChangeUserActivateStatusUseCase extends UseCase<void , UserData>{
  final UsersRepo _usersRepo;

  ChangeUserActivateStatusUseCase(this._usersRepo);

  @override
  Future<Either<Failure, void>> call(UserData userData) {
    return _usersRepo.changeUserActiveStatus(userData.userId, userData.isActive);
  }
}

class UserData
{
  final String userId;
  final bool isActive;

  UserData(this.userId, this.isActive);
}
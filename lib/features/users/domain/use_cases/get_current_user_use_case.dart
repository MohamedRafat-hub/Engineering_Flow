
import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repos/users_repo.dart';

class GetCurrentUserUseCase extends UseCase<UserEntity, void> {
  final UsersRepo _usersRepo;

  GetCurrentUserUseCase(this._usersRepo);

  @override
  Future<Either<Failure, UserEntity>> call(void params) {
    return _usersRepo.getCurrentUser();
  }

}

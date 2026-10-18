import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';

import '../../../../core/use_cases/use_case.dart';

class GetAllUsersUseCase
    extends StreamUseCase<List<UserEntity>, void> {
  final UsersRepo _usersRepo;

  GetAllUsersUseCase(this._usersRepo);

  @override
  Stream<Either<Failure, List<UserEntity>>> call(void params) {
    return _usersRepo.getAllUsers();
  }
}
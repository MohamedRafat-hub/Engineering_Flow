import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';

import '../../../../core/use_cases/use_case.dart';

class GetAllUsersUseCase extends UseCase<List<CreateUserEntity>, void> {
  final UsersRepo _usersRepo;

  GetAllUsersUseCase(this._usersRepo);

  @override
  Future<Either<Failure, List<CreateUserEntity>>> call(params) {
   return  _usersRepo.getAllUsers();
  }


}
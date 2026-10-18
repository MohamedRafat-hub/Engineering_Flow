import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/core/use_cases/use_case.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

import '../repos/users_repo.dart';

class CreateUserAccountUseCase extends UseCase<void, CreateUserAccountParams> {
  final UsersRepo _usersRepo;

  CreateUserAccountUseCase(this._usersRepo);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _usersRepo.createUserAccount(
      email: params.userEntity.email,
      password: params.password,
      userData: params.userEntity.toMap(),
    );
  }
}

class CreateUserAccountParams {
  final String password;
  final UserEntity userEntity;

  CreateUserAccountParams({
    required this.password,
    required this.userEntity,
  });
}

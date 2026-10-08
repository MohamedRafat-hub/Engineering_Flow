import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/core/use_cases/use_case.dart';
import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';

import '../repos/users_repo.dart';

class CreateUserAccountUseCase extends UseCase<void, CreateUserAccountParams> {
  final UsersRepo _usersRepo;

  CreateUserAccountUseCase(this._usersRepo);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _usersRepo.createUserAccount(
      email: params.createUserEntity.email,
      password: params.password,
      userData: params.createUserEntity.toMap(),
    );
  }
}

class CreateUserAccountParams {
  final String password;
  final CreateUserEntity createUserEntity;

  CreateUserAccountParams({
    required this.password,
    required this.createUserEntity,
  });
}

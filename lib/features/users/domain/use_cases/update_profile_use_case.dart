import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/core/use_cases/use_case.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';

class UpdateProfileUseCase
    extends UseCase<void, UpdateProfileParams> {
  final UsersRepo _usersRepo;

  UpdateProfileUseCase(this._usersRepo);

  @override
  Future<Either<Failure, void>> call(
      UpdateProfileParams params,
      ) {
    return _usersRepo.updateProfile(
      userId: params.userId,
      data: params.data,
    );
  }
}

class UpdateProfileParams {
  final String userId;
  final Map<String, dynamic> data;

  const UpdateProfileParams({
    required this.userId,
    required this.data,
  });
}
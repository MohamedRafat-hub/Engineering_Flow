
import 'package:engineering_flow/core/di/service_locator.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';
import 'package:engineering_flow/features/users/presentation/managers/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_current_user_use_case.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  ProfileCubit(this._getCurrentUserUseCase)
      : super(const ProfileState());

  Future<void> getCurrentUser() async {
    emit(state.copyWith(
      status: ProfileStatus.loading,
      clearError: true,
    ));

    final result = await _getCurrentUserUseCase(
      getIt.get<UsersRepo>()
    );

    if (isClosed) return;

    result.fold(
          (failure) {
        emit(state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: failure.message,
        ));
      },
          (user) {
        emit(state.copyWith(
          status: ProfileStatus.success,
          user: user,
          clearError: true,
        ));
      },
    );
  }
}

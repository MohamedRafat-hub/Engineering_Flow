
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';
import 'package:engineering_flow/features/users/domain/enums/user_filter.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_all_users_use_case.dart';
import 'package:engineering_flow/features/users/domain/use_cases/change_user_activate_status_use_case.dart';
import '../../../../../core/errors/failures.dart';
import 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(
      this._allUsersUseCase,
      this._changeUserActivateStatusUseCase,
      ) : super(const GetUsersState());

  final GetAllUsersUseCase _allUsersUseCase;
  final ChangeUserActivateStatusUseCase
  _changeUserActivateStatusUseCase;

  StreamSubscription<Either<Failure, List<UserEntity>>>?
  _usersSubscription;

  List<UserEntity> _allUsers = const [];
  String _searchQuery = '';

  void getUsers() {
    if (_usersSubscription != null) return;

    emit(
      state.copyWith(
        status: GetUsersStatus.loading,
        clearError: true,
      ),
    );

    log('Listening to users stream...');

    _usersSubscription = _allUsersUseCase.call(null).listen(
          (result) {
        if (isClosed) return;

        result.fold(
              (failure) {
            emit(
              state.copyWith(
                status: GetUsersStatus.failure,
                errorMessage: failure.message,
              ),
            );
          },
              (users) {
            _allUsers = List.unmodifiable(users);

            emit(
              state.copyWith(
                status: GetUsersStatus.success,
                users: _applyFilterAndSearch(),
                recentUsers: _getRecentUsers(),
                statistics: UsersStatistics.fromUsers(_allUsers),
                clearError: true,
              ),
            );
          },
        );
      },
      onError: (Object error, StackTrace stackTrace) {
        log(
          'Users stream error',
          error: error,
          stackTrace: stackTrace,
        );

        if (isClosed) return;

        emit(
          state.copyWith(
            status: GetUsersStatus.failure,
            errorMessage: 'Unable to receive users updates.',
          ),
        );
      },
      onDone: () {
        _usersSubscription = null;
        log('Users stream closed.');
      },
    );
  }

  void changeFilter(UserFilter filter) {
    emit(
      state.copyWith(
        selectedFilter: filter,
        users: _applyFilterAndSearch(filter: filter),
      ),
    );
  }

  void searchOnUser(String query) {
    _searchQuery = query;

    emit(
      state.copyWith(
        users: _applyFilterAndSearch(),
      ),
    );
  }

  void getRecentUsers() {
    emit(
      state.copyWith(
        recentUsers: _getRecentUsers(),
      ),
    );
  }

  List<UserEntity> _applyFilterAndSearch({
    UserFilter? filter,
  }) {
    Iterable<UserEntity> users = _allUsers;

    switch (filter ?? state.selectedFilter) {
      case UserFilter.active:
        users = users.where((user) => user.isActive);
      case UserFilter.disabled:
        users = users.where((user) => !user.isActive);
      case UserFilter.all:
        break;
    }

    final query = _searchQuery.trim().toLowerCase();

    if (query.isNotEmpty) {
      users = users.where(
            (user) => user.name.toLowerCase().contains(query),
      );
    }

    return List.unmodifiable(users);
  }

  List<UserEntity> _getRecentUsers() {
    return List.unmodifiable(_allUsers.reversed.take(3));
  }

  @override
  Future<void> close() async {
    await _usersSubscription?.cancel();
    _usersSubscription = null;

    return super.close();
  }

  Future<void> changeActivateStatus({
    required String userId,
    required bool isActive,
  }) async {
    try {
      final result = await _changeUserActivateStatusUseCase.call(
        UserData(userId, isActive),
      );

      if (isClosed) return;

      result.fold(
            (failure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
            ),
          );
        },
            (_) {
          log(
            'User $userId activation status updated to $isActive',
          );

          // The Firestore stream will update the users list
          // and statistics automatically.
        },
      );
    } catch (error, stackTrace) {
      log(
        'Failed to change user activation status',
        error: error,
        stackTrace: stackTrace,
      );

      if (isClosed) return;

      emit(
        state.copyWith(
          errorMessage: 'Failed to update user status.',
        ),
      );
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';
import 'package:engineering_flow/features/users/domain/enums/user_filter.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_all_users_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(GetAllUsersUseCase allUsersUseCase)
    : _allUsersUseCase = allUsersUseCase,
      super(GetUsersInitial());

  final GetAllUsersUseCase _allUsersUseCase;

  List<CreateUserEntity> allUsers = [];
  List<CreateUserEntity> filteredUsers = [];

  int allUsersCount = 0;
  int activeUsersCount = 0;
  int disableUsersCount = 0;

  Future<void> getUsers() async {
    log("New request");
    final result = await _allUsersUseCase.call(null);

    result.fold(
      (error) {
        emit(GetUsersFailure(error.message));
      },
      (users) {
        allUsers = users;

        allUsersCount = allUsers.length;

        activeUsersCount = allUsers.where((e) => e.isActive).length;

        disableUsersCount = allUsers.where((e) => !e.isActive).length;

        emit(GetUsersSuccess(users));
      },
    );
  }

  void changeFilter(UserFilter filter) {

    if (filter == UserFilter.all) {
      filteredUsers = allUsers;
    } else if (filter == UserFilter.active) {
      filteredUsers = allUsers.where((e) => e.isActive).toList();
    } else {
      filteredUsers = allUsers.where((e) => !e.isActive).toList();
    }

    emit(GetUsersSuccess(filteredUsers));
  }

  void searchOnUser(String name) {
    List<CreateUserEntity> users = filteredUsers
        .where((e) => e.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(GetUsersSuccess(users));
  }
}

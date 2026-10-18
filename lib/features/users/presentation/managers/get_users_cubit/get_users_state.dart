
import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/enums/user_filter.dart';
import '../../../domain/enums/user_role.dart';

enum GetUsersStatus {
  initial,
  loading,
  success,
  failure,
}

@immutable
class UsersStatistics {
  const UsersStatistics({
    this.totalUsers = 0,
    this.activeUsers = 0,
    this.disabledUsers = 0,
    this.admins = 0,
    this.managers = 0,
    this.employees = 0,
  });

  final int totalUsers;
  final int activeUsers;
  final int disabledUsers;
  final int admins;
  final int managers;
  final int employees;

  double get activeUsersPercentage {
    if (totalUsers == 0) return 0;

    return activeUsers / totalUsers * 100;
  }

  factory UsersStatistics.fromUsers(
      List<UserEntity> users,
      ) {
    return UsersStatistics(
      totalUsers: users.length,
      activeUsers: users.where((u) => u.isActive).length,
      disabledUsers: users.where((u) => !u.isActive).length,
      admins: users.where((u) => u.role == UserRole.admin).length,
      managers: users.where((u) => u.role == UserRole.manager).length,
      employees: users.where((u) => u.role == UserRole.employee).length,
    );
  }
}

@immutable
class GetUsersState {
  const GetUsersState({
    this.status = GetUsersStatus.initial,
    this.users = const [],
    this.recentUsers = const [],
    this.statistics = const UsersStatistics(),
    this.errorMessage,
    this.selectedFilter = UserFilter.all,  this.isActive = true,
  });

  final GetUsersStatus status;
  final List<UserEntity> users;
  final List<UserEntity> recentUsers;
  final UsersStatistics statistics;
  final String? errorMessage;
  final UserFilter selectedFilter;
  final bool isActive;

  GetUsersState copyWith({
    GetUsersStatus? status,
    List<UserEntity>? users,
    List<UserEntity>? recentUsers,
    UsersStatistics? statistics,
    String? errorMessage,
    UserFilter? selectedFilter,
    bool clearError = false,
    bool? isActive,
  }) {
    return GetUsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      recentUsers: recentUsers ?? this.recentUsers,
      statistics: statistics ?? this.statistics,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      isActive: isActive ?? this.isActive,
    );
  }
}



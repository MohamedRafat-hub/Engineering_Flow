part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}
final class GetUsersLoading extends GetUsersState {}
final class GetUsersSuccess extends GetUsersState {
  final List<CreateUserEntity> users;

  GetUsersSuccess(this.users);
}
final class GetUsersFailure extends GetUsersState {
  final String message;

  GetUsersFailure(this.message);
}

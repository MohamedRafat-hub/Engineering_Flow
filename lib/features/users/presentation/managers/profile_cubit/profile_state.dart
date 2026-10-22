
import 'package:equatable/equatable.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  failure,
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    UserEntity? user,
    String? errorMessage,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: clearUser ? null : user ?? this.user,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    errorMessage,
  ];
}

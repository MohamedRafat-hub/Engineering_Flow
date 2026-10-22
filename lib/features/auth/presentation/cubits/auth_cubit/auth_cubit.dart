import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/password_reset_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/logout_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      LoginUseCase loginUseCase,
      PasswordResetUseCase passwordResetUseCase,
      LogoutUseCase logoutUseCase,
      ) : _loginUseCase = loginUseCase,
        _passwordResetUseCase = passwordResetUseCase,
        _logoutUseCase = logoutUseCase,
        super(AuthInitial());
  final LogoutUseCase _logoutUseCase;
  final LoginUseCase _loginUseCase;
  final PasswordResetUseCase _passwordResetUseCase;

  Timer? _resendTimer;

  void startResendCooldown() {
    int cooldown = 15;

    _resendTimer?.cancel();

    emit(ResendCooldownChanged(cooldown));

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      cooldown--;

      if (cooldown <= 0) {
        timer.cancel();
        cooldown = 0;
      }

      emit(ResendCooldownChanged(cooldown));
    });
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }

  Future<void> login(LoginParams loginParams) async {
    emit(AuthLoading());
    var result = await _loginUseCase.call(loginParams);

    result.fold(
      (error) {
        emit(AuthFailure(error.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> passwordReset(String email) async {
    var result = await _passwordResetUseCase.call(email);
    result.fold(
      (error) {
        emit(AuthFailure(error.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> resendPasswordReset(String email) async {
    var result = await _passwordResetUseCase.call(email);

    result.fold(
      (error) {
        emit(AuthFailure(error.message));
      },
      (success) {
        startResendCooldown();
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLogoutLoading());

    final result = await _logoutUseCase.call(null);

    if (isClosed) return;

    result.fold(
          (failure) {
        emit(AuthLogoutFailure(failure.message));
      },
          (_) {
        emit(AuthLogoutSuccess());
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(super.initialState, LoginUseCase loginUseCase)
    : _loginUseCase = loginUseCase;

  final LoginUseCase _loginUseCase;

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
}

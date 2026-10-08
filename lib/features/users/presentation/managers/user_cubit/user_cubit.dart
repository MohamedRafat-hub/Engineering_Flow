import 'package:bloc/bloc.dart';
import 'package:engineering_flow/features/users/domain/use_cases/create_user_account_use_case.dart';
import 'package:meta/meta.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final CreateUserAccountUseCase _createUserAccountUseCase;

  UserCubit(this._createUserAccountUseCase) : super(UserInitial());

  Future<void> createUserAccount({
    required CreateUserAccountParams params,
  }) async {
    emit(UserLoading());

    var result =await  _createUserAccountUseCase.call(params);
    result.fold((error){
      emit(UserFailure(error.message));
    }, (success){
      emit(UserSuccess());
    });
  }
}

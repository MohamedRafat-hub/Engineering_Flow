import 'package:dartz/dartz.dart';
import 'package:engineering_flow/core/errors/exceptions.dart';
import 'package:engineering_flow/core/errors/failures.dart';
import 'package:engineering_flow/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:engineering_flow/features/auth/domain/entities/uer_entity.dart';
import 'package:engineering_flow/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{

  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, UserEntity>> login({required String email, required String password})async {
    try {
      UserEntity userEntity =await  _authRemoteDataSource.login(email: email, password: password);
      return right(userEntity);
      
    } on AuthException catch (e) {
      return left(AuthFailure(e.message));
    }

    catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> passwordReset({required String email})async {
    try {
      var result = await _authRemoteDataSource.passwordReset(email: email);
      return right(result);
    } on AuthException catch (e) {
      return left(AuthFailure(e.message));
    }catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
 }
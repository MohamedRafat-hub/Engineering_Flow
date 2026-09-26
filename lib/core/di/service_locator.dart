import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:engineering_flow/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:engineering_flow/features/auth/domain/repositories/auth_repo.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
final getIt = GetIt.instance;
void setUp(){
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(getIt.get<FirebaseAuthService>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<AuthRemoteDataSource>()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<AuthRepo>()));
}
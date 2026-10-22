import 'package:engineering_flow/core/services/database_service.dart';
import 'package:engineering_flow/core/services/firebase_auth_service.dart';
import 'package:engineering_flow/core/services/firestore_service.dart';
import 'package:engineering_flow/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:engineering_flow/features/auth/domain/repositories/auth_repo.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/login_use_case.dart';
import 'package:engineering_flow/features/auth/domain/use_cases/password_reset_use_case.dart';
import 'package:engineering_flow/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:engineering_flow/features/users/data/repos/users_repo_impl.dart';
import 'package:engineering_flow/features/users/domain/repos/users_repo.dart';
import 'package:engineering_flow/features/users/domain/use_cases/change_user_activate_status_use_case.dart';
import 'package:engineering_flow/features/users/domain/use_cases/create_user_account_use_case.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_all_users_use_case.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_current_user_use_case.dart';
import 'package:engineering_flow/features/users/presentation/managers/profile_cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(getIt.get<FirebaseAuthService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<AuthRemoteDataSource>()),
  );
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<AuthRepo>()));
  getIt.registerSingleton(PasswordResetUseCase(getIt.get<AuthRepo>()));
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<UsersRemoteDataSource>(
    UsersRemoteDataSourceImpl(
      getIt.get<DatabaseService>(),
      getIt.get<FirebaseAuthService>(),
    ),
  );
  getIt.registerSingleton<UsersRepo>(
    UsersRepoImpl(getIt.get<UsersRemoteDataSource>()),
  );


  getIt.registerSingleton(CreateUserAccountUseCase(getIt.get<UsersRepo>()));

  getIt.registerSingleton(GetAllUsersUseCase(getIt.get<UsersRepo>()));

  getIt.registerSingleton(ChangeUserActivateStatusUseCase(getIt.get<UsersRepo>()));

  getIt.registerSingleton(GetCurrentUserUseCase(getIt.get<UsersRepo>()));

  getIt.registerFactory<ProfileCubit>(
        () => ProfileCubit(getIt<GetCurrentUserUseCase>()),
  );}

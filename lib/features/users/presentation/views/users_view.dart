import 'package:engineering_flow/core/di/service_locator.dart';
import 'package:engineering_flow/features/users/domain/enums/user_filter.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_all_users_use_case.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/users_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/widgets/main_app_bar.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Users'),
      body: BlocProvider(
        create: (context) =>
            GetUsersCubit(getIt.get<GetAllUsersUseCase>())
              ..getUsers()..changeFilter(UserFilter.all),
        child: UsersViewBody(),
      ), // Replace with UsersViewBody() when implemented
    );
  }
}

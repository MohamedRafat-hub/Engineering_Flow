import 'package:engineering_flow/core/di/service_locator.dart';
import 'package:engineering_flow/core/widgets/app_bottom_nav_bar.dart';
import 'package:engineering_flow/features/users/domain/use_cases/change_user_activate_status_use_case.dart';
import 'package:engineering_flow/features/users/domain/use_cases/get_all_users_use_case.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:engineering_flow/features/users/presentation/views/user_details_view.dart';
import 'package:engineering_flow/features/users/presentation/views/users_view.dart';
import 'package:engineering_flow/projects_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard/presentation/views/dashboard_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> screens = const [
    DashboardView(),
    UsersView(),
    ProjectsView(),
    UserDetailsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => GetUsersCubit(getIt.get<GetAllUsersUseCase>() , getIt.get<ChangeUserActivateStatusUseCase>())..getUsers(),
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}

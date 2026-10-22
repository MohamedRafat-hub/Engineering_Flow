import 'package:engineering_flow/core/widgets/main_app_bar.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/app_bar_brand.dart';
import '../../../../core/widgets/back_app_bar.dart';
import '../managers/profile_cubit/profile_cubit.dart';
import 'widgets/user_details_action_bar.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MainAppBar(title: "User Details"),
      body: SafeArea(child: BlocProvider(
        create: (_) => getIt<ProfileCubit>()..getCurrentUser(),
        child: const UserDetailsViewBody(),
      )),
      bottomNavigationBar: UserDetailsActionBar(),
    );
  }
}

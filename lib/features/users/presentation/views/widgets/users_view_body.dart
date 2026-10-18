import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:engineering_flow/core/theme/app_text_styles.dart';
import 'package:engineering_flow/core/widgets/app_search_field.dart';
import 'package:engineering_flow/core/widgets/scrollable_centered_body.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_list_tile.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_page_header.dart';
import 'package:engineering_flow/features/users/presentation/views/widgets/user_status_filter_row.dart';

import '../../managers/get_users_cubit/get_users_state.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableCenteredBody(
      children: [
        const UsersPageHeader(),
        const SizedBox(height: 20),
        AppSearchField(
          hintText: 'Search users by name...',
          onChanged: context.read<GetUsersCubit>().searchOnUser,
        ),
        const SizedBox(height: 16),
        const UserStatusFilterRow(),
        const SizedBox(height: 20),
        BlocBuilder<GetUsersCubit, GetUsersState>(
          builder: (context, state) {
            final users = state.users;

            if (state.status == GetUsersStatus.initial ||
                (state.status == GetUsersStatus.loading && users.isEmpty)) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == GetUsersStatus.failure && users.isEmpty) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Something went wrong.',
                  style: AppTextStyles.statusPill,
                ),
              );
            }

            if (users.isEmpty) {
              return Center(
                child: Text('No users found', style: AppTextStyles.appBarTitle),
              );
            }

            return Column(
              children: [
                if (state.status == GetUsersStatus.loading)
                  const LinearProgressIndicator(),
                if (state.status == GetUsersStatus.failure)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Could not refresh users. Showing previous data.',
                      style: AppTextStyles.statusPill,
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: UserListTile(userEntity: users[index]),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

import 'package:engineering_flow/features/users/domain/enums/user_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/counter_filter_chip.dart';
import '../../managers/get_users_cubit/get_users_cubit.dart';
import '../../managers/get_users_cubit/get_users_state.dart';

class UserStatusFilterRow extends StatelessWidget {
  const UserStatusFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<GetUsersCubit, GetUsersState>(
        builder: (context, state) {
          final statistics = state.statistics;
          final cubit = context.read<GetUsersCubit>();

          return Row(
            children: [
              CountFilterChip(
                label: 'All',
                count: statistics.totalUsers,
                selected: state.selectedFilter == UserFilter.all,
                onTap: () => cubit.changeFilter(UserFilter.all),
              ),
              const SizedBox(width: 10),
              CountFilterChip(
                label: 'Active',
                count: statistics.activeUsers,
                selected: state.selectedFilter == UserFilter.active,
                onTap: () => cubit.changeFilter(UserFilter.active),
              ),
              const SizedBox(width: 10),
              CountFilterChip(
                label: 'Disabled',
                count: statistics.disabledUsers,
                selected: state.selectedFilter == UserFilter.disabled,
                onTap: () => cubit.changeFilter(UserFilter.disabled),
              ),
            ],
          );
        },
      ),
    );
  }
}

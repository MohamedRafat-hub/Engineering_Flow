import 'package:engineering_flow/features/users/domain/enums/user_filter.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/counter_filter_chip.dart';

class UserStatusFilterRow extends StatefulWidget {
  const UserStatusFilterRow({super.key});


  @override
  State<UserStatusFilterRow> createState() => _UserStatusFilterRowState();
}

class _UserStatusFilterRowState extends State<UserStatusFilterRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<GetUsersCubit, GetUsersState>(
  builder: (context, state) {
    return Row(
        children: [
          CountFilterChip(
            label: 'All',
            count:  context.read<GetUsersCubit>().allUsersCount,
            selected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
                context.read<GetUsersCubit>().changeFilter(UserFilter.all);
              });
            }, // TODO(logic): filter: all users
          ),
          const SizedBox(width: 10),
          CountFilterChip(
            label: 'Active',
            count: context.read<GetUsersCubit>().activeUsersCount,
            selected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
                context.read<GetUsersCubit>().changeFilter(UserFilter.active);
              });
            }, // TODO(logic): filter: active users
          ),
          const SizedBox(width: 10),
          CountFilterChip(
            count:  context.read<GetUsersCubit>().disableUsersCount,
            label: 'Disabled',
            selected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
                context.read<GetUsersCubit>().changeFilter(UserFilter.disabled);
              });
            }, // TODO(logic): filter: disabled users
          ),
        ],
      );
  },
),
    );
  }
}

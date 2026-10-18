import 'package:engineering_flow/core/theme/app_text_styles.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../../../users/presentation/managers/get_users_cubit/get_users_state.dart';
import 'recent_activity_header.dart';
import 'recent_activity_shimmer.dart'; // Import the new shimmer widget
import 'user_activity_tile.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecentActivityHeader(),
          const SizedBox(height: 14),
          BlocBuilder<GetUsersCubit, GetUsersState>(
            builder: (context, state) {
              final recentUsers = state.recentUsers;

              if (state.status == GetUsersStatus.initial ||
                  (state.status == GetUsersStatus.loading &&
                      recentUsers.isEmpty)) {
                return const RecentActivityShimmer();
              }

              if (state.status == GetUsersStatus.failure &&
                  recentUsers.isEmpty) {
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Something went wrong.',
                    style: AppTextStyles.statusPill,
                  ),
                );
              }

              if (recentUsers.isEmpty) {
                return Center(
                  child: Text(
                    'No recent activity',
                    style: AppTextStyles.appBarTitle,
                  ),
                );
              }

              return Column(
                children: [
                  if (state.status == GetUsersStatus.loading)
                    const LinearProgressIndicator(),
                  ListView.builder(
                    itemCount: recentUsers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: UserActivityTile(userEntity: recentUsers[index]),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
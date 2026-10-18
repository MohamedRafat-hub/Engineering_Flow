import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_chip.dart';
import '../../../../../core/widgets/stat_card.dart';
import '../../../../users/presentation/managers/get_users_cubit/get_users_state.dart';
import 'dashboard_status_shimmer.dart';
import 'dashboard_status_trend.dart';

class DashboardStatsRow extends StatelessWidget {
  const DashboardStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        if (state.status == GetUsersStatus.initial ||
            (state.status == GetUsersStatus.loading &&
                state.statistics.totalUsers == 0)) {
          return const DashboardStatsShimmer();
        }

        if (state.status == GetUsersStatus.failure &&
            state.statistics.totalUsers == 0) {
          return Center(
            child: Text(
              state.errorMessage ?? 'Failed to load users.',
              textAlign: TextAlign.center,
            ),
          );
        }

        final statistics = state.statistics;

        return Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StatCard(
                    label: 'Total Users',
                    value: statistics.totalUsers.toString(),
                    icon: IconChip(
                      icon: SvgPicture.asset(
                        AppAssets.userSchedulingIcon,
                        width: 18,
                        height: 18,
                      ),
                      backgroundColor: AppColors.badgeBackground,
                      shape: BoxShape.rectangle,
                      radius: 10,
                      size: 36,
                    ),
                    trailing: const DashboardStatTrend.icon(
                      icon: Icons.trending_up,
                      text: '+2 this month',
                      color: AppColors.link,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    label: 'Active Status',
                    value: statistics.activeUsers.toString(),
                    icon: IconChip(
                      icon: SvgPicture.asset(
                        AppAssets.activeUserIcon,
                        width: 18,
                        height: 18,
                      ),
                      backgroundColor: AppColors.badgeBackground,
                      shape: BoxShape.rectangle,
                      radius: 10,
                      size: 36,
                    ),
                    trailing: DashboardStatTrend.dot(
                      text:
                          '${statistics.activeUsersPercentage.toStringAsFixed(1)}% active rate',
                      color: AppColors.link,
                    ),
                  ),
                ),
              ],
            ),
            if (state.status == GetUsersStatus.loading)
              const Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          ],
        );
      },
    );
  }
}

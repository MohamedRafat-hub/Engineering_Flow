import 'package:engineering_flow/features/dashboard/presentation/views/widgets/role_tier_shimmer.dart';
import 'package:engineering_flow/features/users/presentation/managers/get_users_cubit/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icon_chip.dart';
import '../../../../../core/widgets/metric_tile.dart';
import '../../../../users/presentation/managers/get_users_cubit/get_users_state.dart';

class RoleTierRow extends StatelessWidget {
  const RoleTierRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        final statistics = state.statistics;

        final hasData = statistics.totalUsers > 0;

        if (state.status == GetUsersStatus.initial ||
            (state.status == GetUsersStatus.loading && !hasData)) {
          return const RoleTierShimmer();
        }

        if (state.status == GetUsersStatus.failure && !hasData) {
          return Center(
            child: Text(
              state.errorMessage ?? 'Something went wrong.',
              style: AppTextStyles.statusPill,
            ),
          );
        }

        return Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: MetricTile(
                    icon: IconChip(
                      icon: SvgPicture.asset(
                        AppAssets.managersIcon,
                        width: 16,
                        height: 16,
                      ),
                      backgroundColor: AppColors.badgeBackground,
                      size: 40,
                    ),
                    value: statistics.managers.toString(),
                    label: 'Managers',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MetricTile(
                    icon: IconChip(
                      icon: SvgPicture.asset(
                        AppAssets.employeesIcon,
                        width: 16,
                        height: 16,
                      ),
                      backgroundColor: AppColors.badgeBackground,
                      size: 40,
                    ),
                    value: statistics.employees.toString(),
                    label: 'Employees',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MetricTile(
                    icon: IconChip(
                      icon: SvgPicture.asset(
                        AppAssets.adminIcon,
                        width: 16,
                        height: 16,
                      ),
                      backgroundColor: AppColors.badgeBackground,
                      size: 40,
                    ),
                    value: statistics.admins.toString(),
                    label: 'Admins',
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

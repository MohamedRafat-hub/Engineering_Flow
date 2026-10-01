import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_chip.dart';
import '../../../../../core/widgets/stat_card.dart';
import 'dashboard_status_trend.dart';

class DashboardStatsRow extends StatelessWidget {
  const DashboardStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: StatCard(
            label: 'Total Users',
            value: '34',
            icon: IconChip(
              // TODO(assets): swap for a dedicated "total users" SVG if you add one
              icon: SvgPicture.asset(AppAssets.userSchedulingIcon, width: 18, height: 18),
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
            value: '31',
            icon: IconChip(
              icon: SvgPicture.asset(AppAssets.activeUserIcon, width: 18, height: 18),
              backgroundColor: AppColors.badgeBackground,
              shape: BoxShape.rectangle,
              radius: 10,
              size: 36,
            ),
            trailing: const DashboardStatTrend.dot(
              text: '91.2% active rate',
              color: AppColors.link,
            ),
          ),
        ),
      ],
    );
  }
}
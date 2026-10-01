import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_chip.dart';
import '../../../../../core/widgets/metric_tile.dart';

class RoleTierRow extends StatelessWidget {
  const RoleTierRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MetricTile(
            icon: IconChip(
              icon: SvgPicture.asset(AppAssets.managersIcon, width: 16, height: 16),
              backgroundColor: AppColors.badgeBackground,
              size: 40,
            ),
            value: '6',
            label: 'Managers',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MetricTile(
            icon: IconChip(
              icon: SvgPicture.asset(AppAssets.employeesIcon, width: 16, height: 16),
              backgroundColor: AppColors.badgeBackground,
              size: 40,
            ),
            value: '26',
            label: 'Employees',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MetricTile(
            icon: IconChip(
              icon: SvgPicture.asset(AppAssets.adminIcon, width: 16, height: 16),
              backgroundColor: AppColors.badgeBackground,
              size: 40,
            ),
            value: '2',
            label: 'Admins',
          ),
        ),
      ],
    );
  }
}
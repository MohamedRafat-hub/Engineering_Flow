import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icon_label_chip.dart';

class OrganizationBadgeChip extends StatelessWidget {
  const OrganizationBadgeChip({super.key, required this.organizationName});

  final String organizationName;

  @override
  Widget build(BuildContext context) {
    return IconLabelChip(
      // TODO(assets): swap for an organization SVG via AppAssets if you have one
      icon: const Icon(Icons.apartment, size: 14, color: AppColors.primary),
      label: organizationName,
      backgroundColor: AppColors.badgeBackground,
      textStyle: AppTextStyles.fieldValue,
    );
  }
}
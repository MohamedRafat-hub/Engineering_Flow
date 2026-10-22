import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icon_label_chip.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../../../core/widgets/status_pill.dart';

class UserDetailsHeader extends StatelessWidget {
  const UserDetailsHeader({
    super.key,
    required this.initials,
    required this.name,
    required this.jobTitle,
    required this.roleLabel, required this.isActive,
  });

  final String initials;
  final String name;
  final String jobTitle;
  final String roleLabel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InitialsAvatar(
          initials: initials,
          backgroundColor: AppColors.primary,
          textColor: Colors.white,
          size: 70,
          // NOTE: green here reads as "currently online", distinct from
          // the blue/red used for account Active/Disabled elsewhere.
          statusDotColor: AppColors.success,
        ),
        const SizedBox(height: 16),
        Text(name, style: AppTextStyles.headline),
        const SizedBox(height: 4),
        Text(jobTitle, style: AppTextStyles.subtitle),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconLabelChip(
              icon: const Icon(Icons.shield_outlined, size: 14, color: AppColors.primary),
              label: roleLabel,
              backgroundColor: AppColors.badgeBackground,
              textStyle: AppTextStyles.pill(color: AppColors.primary, weight: FontWeight.w600, size: 12),
            ),
            const SizedBox(width: 8),
            StatusPill(
              label: isActive ? 'Active' : 'Disabled',
              dotColor: isActive ? AppColors.success : Colors.red,
              backgroundColor: AppColors.surface,
              textStyle: AppTextStyles.pill(
                color: isActive ? AppColors.success : Colors.red,
                weight: FontWeight.w700,
                size: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

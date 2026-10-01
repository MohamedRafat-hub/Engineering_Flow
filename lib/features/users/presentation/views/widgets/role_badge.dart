import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/label_pill.dart';

enum UserRole { manager, employee, admin }

class RoleBadge extends StatelessWidget {
  const RoleBadge({super.key, required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context) {
    return switch (role) {
      UserRole.manager => LabelPill(
        label: 'Manager',
        backgroundColor: AppColors.badgeBackground,
        textStyle: AppTextStyles.pill(color: AppColors.primary, weight: FontWeight.w600, size: 11.5),
      ),
      UserRole.employee => LabelPill(
        label: 'Employee',
        backgroundColor: AppColors.tagBackground,
        textStyle: AppTextStyles.pill(color: AppColors.textSecondary, weight: FontWeight.w500, size: 11.5),
      ),
      UserRole.admin => LabelPill(
        label: 'Admin',
        backgroundColor: AppColors.primary,
        textStyle: AppTextStyles.pill(color: Colors.white, weight: FontWeight.w700, size: 11.5),
      ),
    };
  }
}
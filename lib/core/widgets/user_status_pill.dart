import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'status_pill.dart';

enum UserAccountStatus { active, disabled }

/// Shared Active/Disabled indicator for any user-related list
/// (dashboard activity feed, the Users directory, etc.).
class UserStatusPill extends StatelessWidget {
  const UserStatusPill({super.key, required this.status});

  final UserAccountStatus status;

  @override
  Widget build(BuildContext context) {
    final bool active = status == UserAccountStatus.active;

    return StatusPill(
      label: active ? 'Active' : 'Disabled',
      dotColor: active ? AppColors.link : AppColors.danger,
      backgroundColor:
      active ? AppColors.badgeBackground : AppColors.dangerSurface,
      textStyle: AppTextStyles.pill(
        color: active ? AppColors.link : AppColors.danger,
        weight: FontWeight.w700,
        size: 11,
      ),
    );
  }
}
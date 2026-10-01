import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../../../core/widgets/status_pill.dart';

/// Presentational status of a user row — UI concern only (which pill to
/// render), not a reflection of any domain/account model.
enum UserActivityStatus { active, disabled }

class UserActivityTile extends StatelessWidget {
  const UserActivityTile({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
    required this.tier,
    required this.status,
  });

  final String initials;
  final String name;
  final String role;
  final String tier;
  final UserActivityStatus status;

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == UserActivityStatus.active;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InitialsAvatar(initials: initials),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.noticeTitle),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(role, style: AppTextStyles.supportBody),
                    StatusPill(
                      label: tier,
                      dotColor: AppColors.textSecondary,
                      backgroundColor: AppColors.tagBackground,
                      textStyle: AppTextStyles.pill(
                        color: AppColors.textSecondary,
                        size: 10.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          StatusPill(
            label: isActive ? 'Active' : 'Disabled',
            dotColor: isActive ? AppColors.link : AppColors.textHint,
            backgroundColor:
            isActive ? AppColors.badgeBackground : AppColors.tagBackground,
            textStyle: AppTextStyles.pill(
              color: isActive ? AppColors.link : AppColors.textSecondary,
              weight: FontWeight.w700,
              size: 10.5,
            ),
          ),
        ],
      ),
    );
  }
}
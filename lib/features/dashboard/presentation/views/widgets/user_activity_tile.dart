import 'package:engineering_flow/core/utils/helper_functions/get_first_two_characters.dart';
import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../../core/widgets/user_status_pill.dart';

class UserActivityTile extends StatelessWidget {
  const UserActivityTile({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InitialsAvatar(initials: getInitials(userEntity.name)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userEntity.name, style: AppTextStyles.noticeTitle),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(userEntity.jobTitle, style: AppTextStyles.supportBody),
                    StatusPill(
                      label: userEntity.role.name,
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
          UserStatusPill(
            status: userEntity.isActive
                ? UserAccountStatus.active
                : UserAccountStatus.disabled,
          ),
        ],
      ),
    );
  }
}

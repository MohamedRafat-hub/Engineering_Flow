import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:engineering_flow/features/users/domain/entities/user_entity.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/helper_functions/get_first_two_characters.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../../../core/widgets/user_status_pill.dart';
import '../../managers/get_users_cubit/get_users_cubit.dart';
import 'role_badge.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    this.tag,
    required this.userEntity,
  });

  final UserEntity userEntity;
  final Widget? tag;

  @override
  Widget build(BuildContext context) {
    final bool isActive = userEntity.isActive;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InitialsAvatar(
                initials: getInitials(userEntity.name),
                backgroundColor: AppColors.background,
                textColor: AppColors.primary,
                size: 56,
                statusDotColor:
                isActive ? AppColors.link : AppColors.danger,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          userEntity.name,
                          style: AppTextStyles.sectionTitle,
                        ),
                        RoleBadge(role: userEntity.role),
                        if (tag != null) tag!,
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEntity.jobTitle,
                      style: AppTextStyles.supportBody,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.mail_outline,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            userEntity.email,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.supportBody,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.textSecondary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (value) {
                  if (value == 'toggle_status') {
                    context.read<GetUsersCubit>().changeActivateStatus(
                      userId: userEntity.id,
                      isActive: !isActive,
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'toggle_status',
                    child: Row(
                      children: [
                        Icon(
                          isActive
                              ? Icons.block
                              : Icons.check_circle_outline,
                          size: 18,
                          color: isActive
                              ? AppColors.danger
                              : AppColors.link,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isActive
                              ? 'Deactivate User'
                              : 'Activate User',
                          style: AppTextStyles.supportBody.copyWith(
                            color: isActive
                                ? AppColors.danger
                                : AppColors.link,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserStatusPill(
                status: isActive
                    ? UserAccountStatus.active
                    : UserAccountStatus.disabled,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
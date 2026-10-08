import 'package:engineering_flow/features/users/domain/entities/create_user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../../../core/widgets/user_status_pill.dart';
import 'role_badge.dart';

/// One row of the Users directory. [trailing] is the bottom-right slot
/// whose content varies per user (an ID, an "Enable User" action, or an
/// "Workspace Owner" label), kept generic so this tile doesn't need to
/// know about every possible variant.
class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    this.tag,
    required this.userEntity,
  });

  final CreateUserEntity userEntity;

  /// Optional extra tag shown next to the role badge (e.g. "YOU").
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
                initials: _getFirstTwoCharacters(userEntity.name),
                backgroundColor: AppColors.background,
                textColor: AppColors.primary,
                size: 56,
                statusDotColor: isActive ? AppColors.link : AppColors.danger,
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
                    Text(userEntity.jobTitle, style: AppTextStyles.supportBody),
                    // const SizedBox(height: 1),
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
              IconButton(
                onPressed: () {}, // TODO(logic): open per-user actions menu
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserStatusPill(
                status: userEntity.isActive
                    ? UserAccountStatus.active
                    : UserAccountStatus.disabled,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getFirstTwoCharacters(String name) {
    String firstTwo = name.substring(0, 2);
    return firstTwo;
  }
}

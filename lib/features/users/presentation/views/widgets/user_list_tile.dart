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
    required this.initials,
    required this.avatarBackgroundColor,
    required this.avatarTextColor,
    required this.name,
    required this.roleTitle,
    required this.email,
    required this.role,
    required this.status,
    required this.trailing,
    this.tag,
  });

  final String initials;
  final Color avatarBackgroundColor;
  final Color avatarTextColor;
  final String name;
  final String roleTitle;
  final String email;
  final UserRole role;
  final UserAccountStatus status;
  final Widget trailing;

  /// Optional extra tag shown next to the role badge (e.g. "YOU").
  final Widget? tag;

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == UserAccountStatus.active;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InitialsAvatar(
                initials: initials,
                backgroundColor: avatarBackgroundColor,
                textColor: avatarTextColor,
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
                        Text(name, style: AppTextStyles.sectionTitle),
                        RoleBadge(role: role),
                        if (tag != null) tag!,
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(roleTitle, style: AppTextStyles.supportBody),
                    // const SizedBox(height: 1),
                    Row(
                      children: [
                        const Icon(Icons.mail_outline, size: 14, color: AppColors.textSecondary),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            email,
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
                icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserStatusPill(status: status),
              trailing,
            ],
          ),
        ],
      ),
    );
  }
}
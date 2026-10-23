import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/initial_avatar.dart';
import '../../../domain/enums/user_role.dart';
import 'role_badge.dart';

class EditUserSummaryCard extends StatelessWidget {
  const EditUserSummaryCard({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
  });

  final String initials;
  final String name;
  final UserRole role;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          InitialsAvatar(
            initials: initials,
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
            size: 56,
            statusDotColor: AppColors.success,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(name, style: AppTextStyles.sectionTitle),
                RoleBadge(role: role),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

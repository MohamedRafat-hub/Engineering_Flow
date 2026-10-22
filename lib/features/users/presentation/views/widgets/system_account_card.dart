import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/detail_field.dart';
import '../../../../../core/widgets/info_notice_card.dart';
import '../../../../../core/widgets/section_card_header.dart';
import '../../../../../core/widgets/status_pill.dart';

class SystemAccountCard extends StatelessWidget {
  const SystemAccountCard({
    super.key,
    required this.accountStatus,
    required this.createdDate,
    required this.systemRole,
  });

  final String accountStatus;
  final String createdDate;
  final String systemRole;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionCardHeader(
            icon: Icons.admin_panel_settings_outlined,
            title: 'System & Account',
            trailingLabel: 'SECURITY',
          ),
          const SizedBox(height: 18),
          DetailField(
            label: 'Account Status',
            uppercaseLabel: false,
            labelStyle: AppTextStyles.subtitle,
            valueWidget: StatusPill(
              label: accountStatus,
              filled: false,
              dotColor: AppColors.success,
              textStyle: AppTextStyles.fieldValue,
            ),
          ),
          const Divider(height: 28, color: AppColors.noticeBorder),
          DetailField(
            label: 'Created Date',
            value: createdDate,
            uppercaseLabel: false,
            labelStyle: AppTextStyles.subtitle,
          ),
          const Divider(height: 28, color: AppColors.noticeBorder),
          DetailField(
            label: 'System Role',
            value: systemRole,
            uppercaseLabel: false,
            labelStyle: AppTextStyles.subtitle,
          ),
          const SizedBox(height: 16),
          const InfoNoticeCard(
            icon: Icons.lock_outline,
            iconColor: AppColors.primary,
            bordered: false,
            message: TextSpan(
              text: 'Passwords are managed securely and never displayed. '
                  'Password resets must be triggered via secure SSO link.',
            ),
          ),
        ],
      ),
    );
  }
}

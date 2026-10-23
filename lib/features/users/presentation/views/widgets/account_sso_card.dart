import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/locked_field.dart';
import '../../../../../core/widgets/section_card_header.dart';
import '../../../../../core/widgets/tinted_stat_box.dart';

class AccountSsoCard extends StatelessWidget {
  const AccountSsoCard({
    super.key,
    required this.corporateEmail,
    required this.accessScope,
    required this.accountState,
  });

  final String corporateEmail;
  final String accessScope;
  final String accountState;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionCardHeader(
            icon: Icons.shield_outlined,
            title: 'Account & Single Sign-On',
          ),
          const SizedBox(height: 16),
          LockedField(
            label: 'Corporate Email',
            value: corporateEmail,
            prefixIcon: Icons.mail_outline,
            lockLabel: 'SSO Locked',
          ),
          const SizedBox(height: 10),
          const Text(
            'Managed via Enterprise Azure AD. Contact IT Operations to '
            'request identity updates.',
            style: AppTextStyles.supportBody,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TintedStatBox(
                  label: 'Access Scope',
                  value: accessScope,
                  dotColor: AppColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TintedStatBox(
                  label: 'Account State',
                  value: accountState,
                  dotColor: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

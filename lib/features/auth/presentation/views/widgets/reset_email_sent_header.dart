import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'email_sent_icon_badge.dart';

class ResetEmailSentHeader extends StatelessWidget {
  const ResetEmailSentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmailSentIconBadge(),
        SizedBox(height: 8),
        Text('Check your email', style: AppTextStyles.headline),
        SizedBox(height: 10),
        Text(
          "We've sent a password reset link to your "
              'technical operations account.',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
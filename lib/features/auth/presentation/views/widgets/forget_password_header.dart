import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'key_icon_bage.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KeyIconBadge(),
        SizedBox(height: 8),
        Text('Forgot password?', style: AppTextStyles.headline),
        SizedBox(height: 10),
        Text(
          "Enter your email address and we'll send you a "
              'password reset link.',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
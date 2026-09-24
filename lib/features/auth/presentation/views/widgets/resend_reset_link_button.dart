import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ResendResetLinkButton extends StatelessWidget {
  const ResendResetLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {}, // TODO(logic): resend reset link
      icon: const Icon(Icons.sync, size: 16),
      label: const Text('Resend Reset Link'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        minimumSize: const Size(0, 40),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        textStyle: AppTextStyles.resendButton,
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';

class ResendResetLinkSection extends StatelessWidget {
  const ResendResetLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Didn't receive the email verification prompt?",
          textAlign: TextAlign.center,
          style: AppTextStyles.prompt,
        ),
        const SizedBox(height: 12),
        AppButton(
          label: 'Resend Reset Link',
          leadingIcon: Icons.sync,
          variant: AppButtonVariant.accent,
          expanded: false,
          compact: true,
          onPressed: () {}, // TODO(logic): resend reset link
        ),
      ],
    );
  }
}
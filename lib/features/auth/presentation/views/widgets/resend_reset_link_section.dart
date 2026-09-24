import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'resend_reset_link_button.dart';

class ResendResetLinkSection extends StatelessWidget {
  const ResendResetLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Didn't receive the email verification prompt?",
          textAlign: TextAlign.center,
          style: AppTextStyles.prompt,
        ),
        SizedBox(height: 12),
        ResendResetLinkButton(),
      ],
    );
  }
}
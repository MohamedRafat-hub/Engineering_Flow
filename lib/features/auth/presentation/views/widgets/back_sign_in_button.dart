import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class BackToSignInButton extends StatelessWidget {
  const BackToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pop(); // TODO(logic): navigate back
      }, // TODO(logic): navigate back to sign in
      icon: const Icon(Icons.arrow_back, size: 18),
      label: const Text('Back to Sign In', style: AppTextStyles.backLink),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
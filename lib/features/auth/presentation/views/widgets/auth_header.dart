import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

/// Leading visual + title + subtitle, shared by all auth screens.
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  final Widget leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        leading,
        const SizedBox(height: 12),
        Text(title, textAlign: TextAlign.center, style: AppTextStyles.headline),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
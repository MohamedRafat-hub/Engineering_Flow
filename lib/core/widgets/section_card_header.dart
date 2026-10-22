import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Icon + title + optional trailing meta label — the header shape
/// shared by every card-with-a-title in the app.
class SectionCardHeader extends StatelessWidget {
  const SectionCardHeader({
    super.key,
    required this.icon,
    required this.title,
    this.trailingLabel,
  });

  final IconData icon;
  final String title;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.sectionTitle,
          ),
        ),
        if (trailingLabel != null)
          Text(trailingLabel!, style: AppTextStyles.sectionLabel),
      ],
    );
  }
}

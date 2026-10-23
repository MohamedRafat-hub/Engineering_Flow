import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A read-only field display: label + a small lock tag on top, then a
/// muted, non-editable value row below (e.g. an SSO-managed email).
class LockedField extends StatelessWidget {
  const LockedField({
    super.key,
    required this.label,
    required this.value,
    required this.prefixIcon,
    this.lockLabel = 'Locked',
  });

  final String label;
  final String value;
  final IconData prefixIcon;
  final String lockLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.fieldLabel),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 12, color: AppColors.textHint),
                const SizedBox(width: 4),
                Text(lockLabel, style: AppTextStyles.helper),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(prefixIcon, size: 20, color: AppColors.textHint),
              const SizedBox(width: 10),
              Expanded(child: Text(value, style: AppTextStyles.input)),
              const Icon(Icons.lock_outline, size: 18, color: AppColors.textHint),
            ],
          ),
        ),
      ],
    );
  }
}

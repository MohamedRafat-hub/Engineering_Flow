import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Selectable filter pill with a trailing count badge
/// (e.g. "All 34", "Active 31"). Generic enough for any filtered list.
class CountFilterChip extends StatelessWidget {
  const CountFilterChip({
    super.key,
    required this.label,
    required this.count,
    required this.selected,
    this.onTap,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color fg = selected ? Colors.white : AppColors.textPrimary;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: ShapeDecoration(
          color: selected ? AppColors.primary : AppColors.badgeBackground,
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTextStyles.pill(color: fg, weight: FontWeight.w600, size: 13)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: ShapeDecoration(
                color: selected ? Colors.white24 : AppColors.surface,
                shape: const StadiumBorder(),
              ),
              child: Text(
                '$count',
                style: AppTextStyles.pill(color: fg, weight: FontWeight.w700, size: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'status_pill.dart';

/// Small tinted box: an uppercase label on top, a dot + value below.
/// Generic enough for any compact "label + status" stat.
class TintedStatBox extends StatelessWidget {
  const TintedStatBox({
    super.key,
    required this.label,
    required this.value,
    required this.dotColor,
  });

  final String label;
  final String value;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTextStyles.sectionLabel),
          const SizedBox(height: 6),
          StatusPill(
            filled: false,
            dotColor: dotColor,
            label: value,
            textStyle: AppTextStyles.pill(color: AppColors.textPrimary, weight: FontWeight.w700, size: 12.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/status_pill.dart';

class BrandBadge extends StatelessWidget {
  const BrandBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return StatusPill(
      label: label,
      textStyle: AppTextStyles.badge,
      backgroundColor: AppColors.badgeBackground,
      dotColor: AppColors.primary,
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/status_pill.dart';

class SuspendedStatusPill extends StatelessWidget {
  const SuspendedStatusPill({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatusPill(
      label: 'Inactive / Suspended',
      textStyle: AppTextStyles.statusPill,
      backgroundColor: AppColors.dangerSurface,
      dotColor: AppColors.danger,
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/status_pill.dart';

class LivePortalIndicator extends StatelessWidget {
  const LivePortalIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusPill(
      backgroundColor: AppColors.link.withOpacity(0.1),
      label: 'Live Portal',
      dotColor: AppColors.link,
      textStyle: AppTextStyles.pill(
        color: AppColors.link,
        weight: FontWeight.w700,
        size: 12.5,
      ),
    );
  }
}

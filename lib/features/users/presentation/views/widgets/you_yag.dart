import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/label_pill.dart';

class YouTag extends StatelessWidget {
  const YouTag({super.key});

  @override
  Widget build(BuildContext context) {
    return LabelPill(
      label: 'YOU',
      backgroundColor: AppColors.tagBackground,
      textStyle: AppTextStyles.pill(color: AppColors.textPrimary, weight: FontWeight.w700, size: 10.5),
    );
  }
}
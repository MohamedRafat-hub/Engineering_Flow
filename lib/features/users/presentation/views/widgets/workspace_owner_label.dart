import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class WorkspaceOwnerLabel extends StatelessWidget {
  const WorkspaceOwnerLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.verified_user, size: 14, color: AppColors.primary),
        const SizedBox(width: 6),
        Text(
          'Workspace Owner',
          style: AppTextStyles.pill(color: AppColors.primary, weight: FontWeight.w700, size: 11.5),
        ),
      ],
    );
  }
}
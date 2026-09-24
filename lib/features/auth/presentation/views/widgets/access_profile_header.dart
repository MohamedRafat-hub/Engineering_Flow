import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'suspended_status_pill.dart';

class AccessProfileHeader extends StatelessWidget {
  const AccessProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.shield_outlined, size: 16, color: AppColors.textPrimary),
        SizedBox(width: 6),
        Expanded(
          child: Text(
            'Access Profile',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.cardTitle,
          ),
        ),
        SizedBox(width: 8),
        SuspendedStatusPill(),
      ],
    );
  }
}
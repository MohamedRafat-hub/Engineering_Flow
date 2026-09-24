import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SentEmailChip extends StatelessWidget {
  const SentEmailChip({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: const ShapeDecoration(
        color: AppColors.inputFill,
        shape: StadiumBorder(
          side: BorderSide(color: AppColors.noticeBorder),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.alternate_email,
            size: 16,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              email,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.emailChip,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.link,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
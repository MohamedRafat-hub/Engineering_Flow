import 'package:engineering_flow/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_colors.dart';

class EmailSentIconBadge extends StatelessWidget {
  const EmailSentIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Soft glow behind the badge
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AppColors.glow,AppColors.background],
              ),
            ),
          ),
          // Badge
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.badgeBackground,
              shape: BoxShape.circle,
            ),
            // TODO(assets): swap for an SVG via AppAssets if you have one
            child: SvgPicture.asset(AppAssets.mailIcon),
          ),
          // Check badge
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 2),
              ),
              child: const Icon(
                Icons.check,
                size: 14,
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_badge.dart';

class EmailSentIconBadge extends StatelessWidget {
  const EmailSentIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconBadge(
      // TODO(assets): swap for an SVG via AppAssets if you have one
      icon: Icon(
        Icons.mark_email_read_outlined,
        size: 30,
        color: AppColors.link,
      ),
      circleColor: AppColors.badgeBackground,
      haloColor: AppColors.glow,
      accent: BadgeAccent(color: AppColors.primary, size: 24, icon: Icons.check),
    );
  }
}
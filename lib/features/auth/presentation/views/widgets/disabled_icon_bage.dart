import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_badge.dart';

class DisabledIconBadge extends StatelessWidget {
  const DisabledIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconBadge(
      // TODO(assets): swap for an SVG via AppAssets if you have one
      icon: Icon(Icons.gpp_bad, size: 34, color: AppColors.danger),
      circleColor: AppColors.dangerGlowInner,
      haloColor: AppColors.dangerGlowOuter,
      haloSize: 104,
      circleSize: 72,
      softHalo: false,
    );
  }
}
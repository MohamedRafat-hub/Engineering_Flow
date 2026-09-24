import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/icon_badge.dart';

class KeyIconBadge extends StatelessWidget {
  const KeyIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return IconBadge(
      icon: SvgPicture.asset(AppAssets.keyIcon, width: 28, height: 28),
      circleColor: AppColors.surface,
      haloColor: AppColors.glow,
      elevated: true,
      accent: const BadgeAccent(color: AppColors.link, size: 16),
    );
  }
}
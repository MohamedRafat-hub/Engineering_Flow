import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';

class RecentActivityHeader extends StatelessWidget {
  const RecentActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.recentUserIcon, width: 18, height: 18),
        const SizedBox(width: 8),
        const Expanded(
          child: Text('Recent User Activity', style: AppTextStyles.sectionTitle),
        ),
        Text('Latest provisions', style: AppTextStyles.helper),
      ],
    );
  }
}
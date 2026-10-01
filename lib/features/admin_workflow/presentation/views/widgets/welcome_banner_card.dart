import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import 'welcome_badges_row.dart';

class WelcomeBannerCard extends StatelessWidget {
  const WelcomeBannerCard({
    super.key,
    required this.organizationName,
    required this.userFirstName,
    required this.subtitle,
  });

  final String organizationName;
  final String userFirstName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeBadgesRow(organizationName: organizationName),
          const SizedBox(height: 16),
          Text('Good morning, $userFirstName', style: AppTextStyles.headline),
          const SizedBox(height: 6),
          Text(subtitle, style: AppTextStyles.subtitle),
        ],
      ),
    );
  }
}
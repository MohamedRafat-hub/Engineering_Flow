import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import 'role_tier_row.dart';

class DirectoryByRoleCard extends StatelessWidget {
  const DirectoryByRoleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Directory by Role', style: AppTextStyles.sectionTitle),
              Text('3 Tier Hierarchy', style: AppTextStyles.helper),
            ],
          ),
          const SizedBox(height: 16),
          const RoleTierRow(),
        ],
      ),
    );
  }
}
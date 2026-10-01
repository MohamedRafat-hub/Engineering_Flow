import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

/// "Manage all in Users tab  →" — label on the left, arrow pinned to the
/// far right of the card, as one tappable row.
class ManageUsersLink extends StatelessWidget {
  const ManageUsersLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // TODO(logic): navigate to users tab
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Manage all in Users tab', style: AppTextStyles.link),
            Icon(Icons.arrow_forward, size: 18, color: AppColors.link),
          ],
        ),
      ),
    );
  }
}
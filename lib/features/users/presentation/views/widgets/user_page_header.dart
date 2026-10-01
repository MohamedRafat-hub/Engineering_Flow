import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';

class UsersPageHeader extends StatelessWidget {
  const UsersPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Users', style: AppTextStyles.headline),
              SizedBox(height: 4),
              Text('Manage your company members', style: AppTextStyles.subtitle),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // 🛠️ الزرار مباشرة بدون Row وبدون Expanded حوله
        AppButton(
          label: 'Add User',
          leadingIcon: Icons.person_add_alt_1,
          expanded: false,
          onPressed: () {}, // TODO(logic): navigate to add user
        ),
      ],
    );
  }
}
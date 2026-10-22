import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';

class UserDetailsActionBar extends StatelessWidget {
  const UserDetailsActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.noticeBorder)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Edit',
                  leadingIcon: Icons.edit_outlined,
                  onPressed: () {}, // TODO(logic): edit user
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  label: 'Logout',
                  leadingIcon: Icons.logout,
                  variant: AppButtonVariant.danger,
                  onPressed: () {}, // TODO(logic): disable user
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

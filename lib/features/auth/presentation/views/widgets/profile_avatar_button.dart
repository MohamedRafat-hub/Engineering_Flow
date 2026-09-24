import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class ProfileAvatarButton extends StatelessWidget {
  const ProfileAvatarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {}, // TODO(logic): open profile
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        fixedSize: const Size(36, 36),
        padding: EdgeInsets.zero,
      ),
      icon: const Icon(Icons.person_outline, size: 20),
    );
  }
}
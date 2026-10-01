import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class NotificationBellButton extends StatelessWidget {
  const NotificationBellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {}, // TODO(logic): open notifications
      icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
    );
  }
}
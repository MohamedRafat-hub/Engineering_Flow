import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Notification bell shown in every top-level screen's app bar.
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
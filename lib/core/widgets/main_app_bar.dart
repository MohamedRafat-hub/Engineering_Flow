import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_bar_brand.dart';
import 'notification_bell_button.dart';
import 'profile_avatar_button.dart';

/// Standard app bar for every top-level screen (Dashboard, Users,
/// Projects, Profile): eyebrow brand + page title, bell, profile avatar.
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: AppBarBrand.withEyebrow(eyebrow: 'ENGINEERINGFLOW', title: title),
      ),
      actions: const [
        NotificationBellButton(),
        SizedBox(width: 4),
        ProfileAvatarButton(),
        SizedBox(width: 12),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_bar_brand.dart';
import '../../../../../core/widgets/profile_avatar_button.dart';
import 'notification_bell_button.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

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
        padding: const EdgeInsets.only(left: 20),
        child: const AppBarBrand.withEyebrow(
          eyebrow: 'ENGINEERINGFLOW',
          title: 'Dashboard',
        ),
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
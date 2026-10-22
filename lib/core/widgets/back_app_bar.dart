import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'profile_avatar_button.dart';

/// App bar with a back button, a caller-supplied title, and the profile
/// avatar — used by any non-top-level screen (auth flows, detail/form
/// screens pushed on top of the main tabs).
class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, required this.title, this.onBack});

  final Widget title;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      shape: const Border(bottom: BorderSide(color: AppColors.noticeBorder)),
      leading: IconButton(
        onPressed: onBack ?? () {}, // TODO(logic): navigate back
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
      ),
      titleSpacing: 0,
      title: title,
      actions: const [
        ProfileAvatarButton(),
        SizedBox(width: 12),
      ],
    );
  }
}

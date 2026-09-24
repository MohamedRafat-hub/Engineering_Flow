import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import 'app_bar_brand.dart';
import 'profile_avatar_button.dart';

class ForgotPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ForgotPasswordAppBar({super.key});

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
        onPressed: () {
          Navigator.of(context).pop(); // TODO(logic): navigate back
        }, // TODO(logic): navigate back
        icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
      ),
      titleSpacing: 0,
      title: const AppBarBrand(),
      actions: const [
        ProfileAvatarButton(),
        SizedBox(width: 12),
      ],
    );
  }
}
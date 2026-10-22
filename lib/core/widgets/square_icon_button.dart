import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Small rounded-square icon button, used for compact inline actions
/// (copy, call, etc.) next to a [DetailField].
class SquareIconButton extends StatelessWidget {
  const SquareIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = AppColors.badgeBackground,
    this.iconColor = AppColors.primary,
    this.size = 40,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: 18, color: iconColor),
        ),
      ),
    );
  }
}

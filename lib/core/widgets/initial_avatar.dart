import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Circular avatar showing a person's initials. Generic and reusable
/// anywhere a user is represented without a photo (activity feeds,
/// user lists, comments, etc.).
class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.backgroundColor = AppColors.badgeBackground,
    this.textColor = AppColors.primary,
    this.size = 44,
  });

  final String initials;
  final Color backgroundColor;
  final Color textColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Text(
        initials,
        style: TextStyle(
          fontSize: size * 0.32,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
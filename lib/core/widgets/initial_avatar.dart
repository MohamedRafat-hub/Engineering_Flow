import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'icon_badge.dart';

/// Circular avatar showing a person's initials. Generic and reusable
/// anywhere a user is represented without a photo (activity feeds,
/// user lists, comments, etc.). Pass [statusDotColor] to show a small
/// corner indicator (e.g. online/active status).
class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    this.backgroundColor = AppColors.badgeBackground,
    this.textColor = AppColors.primary,
    this.size = 44,
    this.statusDotColor,
  });

  final String initials;
  final Color backgroundColor;
  final Color textColor;
  final double size;
  final Color? statusDotColor;

  @override
  Widget build(BuildContext context) {
    final Widget avatar = Container(
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

    if (statusDotColor == null) return avatar;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: -2,
            bottom: -2,
            child: BadgeAccent(color: statusDotColor!, size: size * 0.32),
          ),
        ],
      ),
    );
  }
}
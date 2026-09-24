import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Circular icon with a halo behind it and an optional corner accent.
class IconBadge extends StatelessWidget {
  const IconBadge({
    super.key,
    required this.icon,
    required this.circleColor,
    required this.haloColor,
    this.haloSize = 120,
    this.circleSize = 64,
    this.softHalo = true,
    this.elevated = false,
    this.accent,
  });

  final Widget icon;
  final Color circleColor;
  final Color haloColor;
  final double haloSize;
  final double circleSize;

  /// Radial fade when true, solid circle when false.
  final bool softHalo;
  final bool elevated;

  /// Small widget pinned to the bottom-right of the circle (see [BadgeAccent]).
  final Widget? accent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: haloSize,
      height: haloSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: softHalo ? null : haloColor,
              gradient: softHalo
                  ? RadialGradient(colors: [haloColor, Colors.transparent])
                  : null,
            ),
          ),
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: circleColor,
                      shape: BoxShape.circle,
                      boxShadow: elevated
                          ? const [
                        BoxShadow(
                          color: Color(0x1A1E3A8A),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ]
                          : null,
                    ),
                    child: icon,
                  ),
                ),
                if (accent != null) Positioned(right: 0, bottom: 0, child: accent!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Small dot / check mark that sits on the corner of an [IconBadge].
class BadgeAccent extends StatelessWidget {
  const BadgeAccent({
    super.key,
    required this.color,
    required this.size,
    this.icon,
  });

  final Color color;
  final double size;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.surface, width: 2),
      ),
      child: icon == null
          ? null
          : Icon(icon, size: size * 0.58, color: AppColors.onPrimary),
    );
  }
}
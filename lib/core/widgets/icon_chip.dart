import 'package:flutter/material.dart';

/// A small icon sitting inside a colored circle or rounded square.
/// Used anywhere an icon needs a tinted "chip" background: stat cards,
/// metric tiles, notice cards, etc.
class IconChip extends StatelessWidget {
  const IconChip({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.size = 40,
    this.shape = BoxShape.circle,
    this.radius = 12,
  });

  final Widget icon;
  final Color backgroundColor;
  final double size;
  final BoxShape shape;

  /// Corner radius used only when [shape] is [BoxShape.rectangle].
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(radius)
            : null,
      ),
      child: icon,
    );
  }
}
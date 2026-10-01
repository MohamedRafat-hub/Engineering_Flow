import 'package:flutter/material.dart';

/// Icon + label inside a pill-shaped, colored background.
/// Distinct from [StatusPill] (which uses a leading dot, not an icon).
class IconLabelChip extends StatelessWidget {
  const IconLabelChip({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.textStyle,
  });

  final Widget icon;
  final String label;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
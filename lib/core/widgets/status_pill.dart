import 'package:flutter/material.dart';

/// Pill with a leading dot and a label (badges, statuses).
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    required this.textStyle,
    required this.backgroundColor,
    required this.dotColor,
  });

  final String label;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(label, style: textStyle),
        ],
      ),
    );
  }
}
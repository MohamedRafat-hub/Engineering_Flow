import 'package:flutter/material.dart';

/// Pill with a leading dot and a label (badges, statuses, tags).
/// Set [filled] to false to render just the dot + label with no
/// background/padding (e.g. an inline "live" indicator).
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    required this.textStyle,
    required this.dotColor,
    this.backgroundColor,
    this.filled = true,
  });

  final String label;
  final TextStyle textStyle;
  final Color dotColor;
  final Color? backgroundColor;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final content = Row(
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
    );

    if (!filled) return content;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: content,
    );
  }
}
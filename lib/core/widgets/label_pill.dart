import 'package:flutter/material.dart';

/// Plain label inside a pill-shaped background — no dot, no icon.
/// Used for role badges, "YOU" tags, and similar flat indicators.
class LabelPill extends StatelessWidget {
  const LabelPill({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  });

  final String label;
  final Color backgroundColor;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Text(label, overflow: TextOverflow.ellipsis, style: textStyle),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';


class DashboardStatTrend extends StatelessWidget {
  const DashboardStatTrend.icon({
    super.key,
    required IconData icon,
    required this.text,
    required this.color,
  })  : icon = icon,
        showDot = false;

  const DashboardStatTrend.dot({
    super.key,
    required this.text,
    required this.color,
  })  : icon = null,
        showDot = true;

  final IconData? icon;
  final bool showDot;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDot)
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          )
        else
          Icon(icon, size: 14, color: color),
        const SizedBox(width: 5),
        Text(text, style: AppTextStyles.pill(color: color, weight: FontWeight.w600, size: 11.5)),
      ],
    );
  }
}
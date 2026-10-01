import 'package:engineering_flow/core/widgets/app_card.dart';
import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// A metric card: label + icon chip on top, a big value, and an optional
/// trailing note (e.g. a trend or a rate). The trailing content is passed
/// in by the caller, so this widget stays agnostic of what it displays.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.trailing,
  });

  final String label;
  final String value;
  final Widget icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle,
                ),
              ),
              icon,
            ],
          ),
          const SizedBox(height: 14),
          Text(value, style: AppTextStyles.headline),
          if (trailing != null) ...[
            const SizedBox(height: 6),
            trailing!,
          ],
        ],
      ),
    );
  }
}
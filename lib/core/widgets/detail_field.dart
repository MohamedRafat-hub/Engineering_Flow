import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// A "label above value" row, optionally with a trailing action
/// (e.g. a copy/call button) and/or a custom widget in place of the
/// plain value text (e.g. a status dot + text).
class DetailField extends StatelessWidget {
  const DetailField({
    super.key,
    required this.label,
    this.value,
    this.valueWidget,
    this.trailing,
    this.uppercaseLabel = true,
    this.labelStyle = AppTextStyles.sectionLabel,
    this.valueStyle = AppTextStyles.fieldValue,
  }) : assert(value != null || valueWidget != null, 'Provide value or valueWidget');

  final String label;
  final String? value;

  /// Overrides the plain [value] text (e.g. a status dot + text).
  final Widget? valueWidget;
  final Widget? trailing;
  final bool uppercaseLabel;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(uppercaseLabel ? label.toUpperCase() : label, style: labelStyle),
              const SizedBox(height: 4),
              valueWidget ?? Text(value!, style: valueStyle),
            ],
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 12), trailing!],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum FieldRequirement { required, optional, none }

/// A field/section label that shows a trailing red "*" (required), an
/// inline muted suffix (e.g. "(Optional)"), or no marker at all. Shared
/// by [AppTextField] and any section header needing the same convention
/// (e.g. "Role *").
class RequiredLabel extends StatelessWidget {
  const RequiredLabel({
    super.key,
    required this.label,
    this.requirement = FieldRequirement.required,
    this.style = AppTextStyles.fieldLabel,
    this.optionalLabel = '(Optional)',
  });

  final String label;
  final FieldRequirement requirement;
  final TextStyle style;

  /// Text shown inline after the label when [requirement] is
  /// [FieldRequirement.optional].
  final String optionalLabel;

  @override
  Widget build(BuildContext context) {
    switch (requirement) {
      case FieldRequirement.required:
        return Text.rich(
          TextSpan(
            text: label,
            style: style,
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: AppColors.required)),
            ],
          ),
        );
      case FieldRequirement.optional:
        return Text.rich(
          TextSpan(
            text: label,
            style: style,
            children: [
              TextSpan(text: ' $optionalLabel', style: AppTextStyles.statusPill),
            ],
          ),
        );
      case FieldRequirement.none:
        return Text(label, style: style);
    }
  }
}
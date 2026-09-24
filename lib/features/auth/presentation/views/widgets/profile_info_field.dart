import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class ProfileInfoField extends StatelessWidget {
  const ProfileInfoField({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.sectionLabel),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.fieldValue),
      ],
    );
  }
}